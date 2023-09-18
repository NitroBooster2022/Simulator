#!/usr/bin/env python3

import argparse
import rospy
import json
import cv2
import os
import time
import numpy as np
from sensor_msgs.msg import Image
# from sensor_msgs.msg import CompressedImage
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import Header
from utils.msg import Lane
from utils.srv import *
# import scipy
# import RPi.GPIO as GPIO
# GPIO.setmode(GPIO.BCM)
# GPIO.setup(17,GPIO.OUT,initial=GPIO.HIGH)
# GPIO.setup(27,GPIO.OUT,initial=GPIO.HIGH)

class LaneDetector():
    def __init__(self, method = 'histogram', show=True):
        self.avg_time = []
        self.method = method
        self.show = show
        if self.method != 'histogram':
            print("Lane detection using houghline transform")
            file = open(os.path.dirname(os.path.realpath(__file__))+'/houghlines.json', 'r')
            data = json.load(file)
            print("houghlines params:")
            print(data)
            self.point = np.array(data.get('point'))
            self.res = data.get('res')
            self.threshold = data.get('threshold')
            self.minlength = data.get('minlength')
            self.error_p = np.array(data.get('error_p'))
            self.error_w = data.get('error_w')
        else:
            print("Lane detection using histogram filter")
            self.maskh = np.zeros((480,640),dtype='uint8')
            h=int(0.8*480)
            polyh = np.array([[(0,h),(640,h),(640,480),(0,480)]]) # polyh might need adjustment
            cv2.fillPoly(self.maskh,polyh,255)
            self.masks = np.zeros((480,640),dtype='uint8')
            polys = np.array([[(0,300),(640,300),(640,340),(0,340)]]) # polys might need adjustment
            cv2.fillPoly(self.masks,polys,255)
        self.image = np.zeros((480,640))
        self.stopline = False
        self.dotted = False
        self.pl = 320 # previous lane center
        self.maskd = np.zeros((480,640),dtype='uint8')
        polyd = np.array([[(0,240),(0,480),(256,480),(256,240)]]) # polyd might need adjustment
        cv2.fillPoly(self.maskd,polyd,255)
        """
        Initialize the lane follower node
        """
        rospy.init_node('lane_detector_node', anonymous=True)
        self.pub = rospy.Publisher("lane", Lane, queue_size=3)
        self.p = Lane()
        self.bridge = CvBridge()

        self.image_sub = rospy.Subscriber("automobile/image_raw", Image, self.image_callback)
        # self.image_sub = rospy.Subscriber("/camera/color/image_raw", Image, self.image_callback)
        # self.image_sub = rospy.Subscriber("/camera/color/image_raw/compressed", CompressedImage, self.image_callback)
        # self.image_sub = rospy.Subscriber("automobile/image_raw/compressed", CompressedImage, self.image_callback)
        self.rate = rospy.Rate(15)

        # dotted line service
        self.server = rospy.Service("dotted", dotted, self.doDotted, buff_size=3)

        # self.brightness = 255
        # self.off = True

        # def shutdown():
        #     GPIO.cleanup()
        #     # GPIO.output(17,GPIO.HIGH)
        # rospy.on_shutdown(shutdown)

    def doDotted(self,request):
        return self.dotted_lines(self.image)

    def image_callback(self, data):
        """
        Callback function for the image processed topic
        :param data: Image data in the ROS Image format
        """
        # t1 = time.time()
        # Update the header information
        header = Header()
        header.seq = data.header.seq
        header.stamp = data.header.stamp
        header.frame_id = data.header.frame_id
        self.p.header = header

        # Convert the image to the OpenCV format
        # image = self.bridge.compressed_imgmsg_to_cv2(data, "bgr8")
        self.image = self.bridge.imgmsg_to_cv2(data, "rgb8")

        #determine whether left lane is dotted (will make it a service)
        self.dotted = self.dotted_lines(self.image)

        # Extract the lanes from the image
        t1 = time.time()
        if self.method == 'histogram':
            lanes = self.histogram(self.image, show=self.show)
            # lanes = self.optimized_histogram(self.image, show=self.show)
        else:
            lanes = self.hough_lines(self.image, show=self.show)
        
        # self.avg_time.append(time.time()-t1)
        # print("average time: ", sum(self.avg_time)/len(self.avg_time))
        
        # print("center, old: ",lanes)
        # # if there's a big shift in lane center: ignore due to delay
        # if abs(lanes-self.pl)>250:
        #     # print("ignored")
        #     lanes = self.pl

        # # ignore one center measurement when we don't detect
        # if lanes==320:
        #     self.p.center = self.pl
        #     # print("ignored")
        #     self.pl = lanes
        # else:
        #     self.p.center = lanes
        #     self.pl = lanes
        #     # print("center: ",self.p.center)

        self.p.center = lanes

        #determine whether we arrive at intersection
        self.p.stopline = self.stopline

        # Publish the lane message
        self.pub.publish(self.p)
        # print(self.p)
        # print("time: ", time.time()-t1)

        # if self.brightness < 30 and self.off:
        #     GPIO.output(17,GPIO.LOW)
        #     # GPIO.output(27,GPIO.LOW)
        #     self.off = False
        #     print("Low visibility: activate headlights")
        # if self.brightness > 50 and (not self.off):
        #     GPIO.output(17,GPIO.HIGH)
        #     # GPIO.output(27,GPIO.HIGH)
        #     self.off = True
        #     print("Deactivate headlights")

    def dotted_lines(self,image):
        """
        Check for dotted lines for left lane using the histogram method
        :param image: Image to extract the lanes from
        :return: Boolean signaling detection
        """
        img_gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        h = img_gray.shape[0]
        img_roi = cv2.bitwise_and(img_gray,self.maskd)
        ret, thresh = cv2.threshold(img_roi, 150, 255, cv2.THRESH_BINARY) # threshold might need adjustment
        hist=np.zeros((int(0.5*h),1))
        v=int(0.5*h)
        for i in range(int(0.5*h)):
            hist[i,0]=np.sum(thresh[i+v,:])
        t = np.mean(hist)
        lanes=[]
        p=0
        for i in range(int(0.5*h)):
            if hist[i,0]>t and p==0:
                lanes.append(i)
                p=t
            elif hist[i,0]<t/2 and p==t:
                lanes.append(i)
                p=0
        if len(lanes)%2==1:
            lanes.append(int(0.5*h)-1)
        if len(lanes)>5:
            return True
        else:
            return False

    def histogram(self, image, show=False):
        """
        Extract the lanes from the image using the histogram method
        :param image: Image to extract the lanes from
        :param show: Boolean to show the image
        :return: The steering angle
        """
        self.stopline = False
        img_gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        # self.brightness = np.mean(img_gray)
        h = 480
        w = 640
        img_roi = cv2.bitwise_and(img_gray,self.maskh)
        t = np.max(img_roi)-55
        if t<30:
            t=30
        np.clip(t,30,200)
        # print(t)
        ret, thresh = cv2.threshold(img_roi, t, 255, cv2.THRESH_BINARY)
        hist=np.zeros((1,w))
        for i in range(w):
            hist[0,i]=np.sum(thresh[:,i])

        #stopline
        img_rois = cv2.bitwise_and(img_gray,self.masks)
        t = np.max(img_roi)-65
        if t<30:
            t=30
        np.clip(t,30,200)
        ret, threshs = cv2.threshold(img_rois, t, 255, cv2.THRESH_BINARY)
        hists=np.zeros((1,w))
        for i in range(w):
            hists[0,i]=np.sum(threshs[:,i])
        lanes=[]
        p=0
        for i in range(w):
            if hists[0,i]>=1500 and p==0:
                lanes.append(i)
                p=255
            elif hists[0,i]==0 and p==255:
                lanes.append(i)
                p=0
        if len(lanes)%2==1:
            lanes.append(w-1)
        for i in range(int(len(lanes)/2)):
            if abs(lanes[2*i]-lanes[2*i+1])>370 and t>30:
                self.stopline = True
                if not show:
                    return w/2

        # get lane marking delimiters
        lanes=[]
        p=0
        for i in range(w):
            if hist[0,i]>=1500 and p==0:
                lanes.append(i)
                p=255
            elif hist[0,i]==0 and p==255:
                lanes.append(i)
                p=0
        if len(lanes)%2==1:
            lanes.append(w-1)

        # get lane markings
        centers=[]
        for i in range(int(len(lanes)/2)):
            if abs(lanes[2*i]-lanes[2*i+1])>350 and t>50:
                self.stopline = True
                if not show:
                    return w/2
            elif abs(lanes[2*i]-lanes[2*i+1])>3: # and abs(lanes[2*i]-lanes[2*i+1])<100: #exclude large lanes
                centers.append((lanes[2*i]+lanes[2*i+1])/2)
        
        # get lane centers based on 4 cases
        if len(centers)==0: # no lane detected
            center = w/2
            # case = 0
        elif len(centers)==1: # one lane detected
            # case = 1
            if centers[0]>w/2:
                center = (centers[0]-0)/2
            else:
                center = (centers[0]*2+640)/2
        elif abs(centers[0]-centers[len(centers)-1])<200: # the left most lane and the right most lane are close together (fuse them)
            # case = 2
            if (centers[0]+centers[len(centers)-1])>w:
                center = ((centers[0]+centers[len(centers)-1])/2+0)/2
            else:
                center = ((centers[0]+centers[len(centers)-1])+640)/2
        else: # the left most lane and the right most lane are far (avg them)
            # case = 3
            center = (centers[0]+centers[len(centers)-1])/2
        if show:
            if self.stopline==True:
                cv2.putText(thresh, 'Stopline detected!', (int(w*0.1),int(h*0.1)), cv2.FONT_HERSHEY_SIMPLEX, 1, (255,255,255), 1, cv2.LINE_AA)
            if self.dotted==True:
                cv2.putText(image, 'DottedLine!', (int(w*0.1),int(h*0.3)), cv2.FONT_HERSHEY_SIMPLEX, 1, (0,0,255), 1, cv2.LINE_AA)
            
            cv2.line(image,(int(center),int(image.shape[0])),(int(center),int(0.8*image.shape[0])),(0,0,255),5)
            add = cv2.cvtColor(thresh,cv2.COLOR_GRAY2RGB)
            cv2.imshow('Lane', cv2.add(image,add))
            # cv2.imshow('Lane', image)
            cv2.waitKey(1)
        return center
    
    def optimized_histogram(self, image, show=False):
        self.stopline = False
        img_gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        h, w = 480, 640
        img_roi = cv2.bitwise_and(img_gray, self.maskh)
        threshold_value = np.clip(np.max(img_roi) - 55, 30, 200)
        _, thresh = cv2.threshold(img_roi, threshold_value, 255, cv2.THRESH_BINARY)
        hist = np.sum(thresh, axis=0)

        img_rois = cv2.bitwise_and(img_gray, self.masks)
        threshold_value_stop = np.clip(np.max(img_roi) - 65, 30, 200)
        _, threshs = cv2.threshold(img_rois, threshold_value_stop, 255, cv2.THRESH_BINARY)
        hists = np.sum(threshs, axis=0)

        def extract_lanes(hist_data):
            lane_indices = []
            previous_value = 0
            for idx, value in enumerate(hist_data):
                if value >= 1500 and previous_value == 0:
                    lane_indices.append(idx)
                    previous_value = 255
                elif value == 0 and previous_value == 255:
                    lane_indices.append(idx)
                    previous_value = 0
            if len(lane_indices) % 2 == 1:
                lane_indices.append(w - 1)
            return lane_indices

        stop_lanes = extract_lanes(hists)
        for i in range(len(stop_lanes) // 2):
            if abs(stop_lanes[2 * i] - stop_lanes[2 * i + 1]) > 370 and threshold_value > 30:
                self.stopline = True

        lanes = extract_lanes(hist)
        centers = [(lanes[2*i] + lanes[2*i + 1]) / 2 for i in range(len(lanes) // 2) if
                3 < abs(lanes[2 * i] - lanes[2 * i + 1])]

        if len(centers) == 0:
            center = w / 2
        elif len(centers) == 1:
            center = (centers[0] - 0) / 2 if centers[0] > w / 2 else (centers[0] * 2 + w) / 2
        elif abs(centers[0] - centers[-1]) < 200:
            center = ((centers[0] + centers[-1]) / 2 + 0) / 2 if (centers[0] + centers[-1]) > w else (
                        centers[0] + centers[-1]) + w / 2
        else:
            center = (centers[0] + centers[-1]) / 2

        if show:
            if self.stopline:
                cv2.putText(thresh, 'Stopline detected!', (int(w * 0.1), int(h * 0.1)), cv2.FONT_HERSHEY_SIMPLEX, 1,
                            (255, 255, 255), 1, cv2.LINE_AA)
            if self.dotted:
                cv2.putText(image, 'DottedLine!', (int(w * 0.1), int(h * 0.3)), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 1, cv2.LINE_AA)

            cv2.line(image, (int(center), int(image.shape[0])), (int(center), int(0.8 * image.shape[0])), (0, 0, 255), 5)
            add = cv2.cvtColor(thresh, cv2.COLOR_GRAY2RGB)
            cv2.imshow('Lane', cv2.add(image, add))
            cv2.waitKey(1)
        return center

    def hough_lines(self, image, show=False): #hough transform
        """
        Extract the lanes from the image
        :param image: Image data in the OpenCV format
        :return: Tuple containing the left and right lanes (each a list of points)
        """
        # Convert the image to grayscale and apply a blur to remove high frequency noise
        # Apply a Canny edge detector to find the edges in the image
        t1 = time.time()
        edges = cv2.Canny(cv2.GaussianBlur(cv2.cvtColor(image, cv2.COLOR_BGR2GRAY),(5,5),0),50,150)

        # Create a mask for the region of interest (ROI) in the image where the lanes are likely to be
        mask = np.zeros_like(edges)
        h = image.shape[0]
        w = image.shape[1]
        vertices = np.array([[(0,h*0.75),(self.point[0]*w,self.point[1]*h),(w,0.75*h),(w,h),(0,h)]], dtype=np.int32)
        cv2.fillPoly(mask, vertices, 255)
        masked_edges = cv2.bitwise_and(edges, mask)

        # Use Hough transform to detect lines in the image
        lines = cv2.HoughLinesP(masked_edges,self.res,np.pi/180,self.threshold,minLineLength=self.minlength)

        # Separate the lines into left and right lanes
        left=[]
        right=[]
        self.stopline = False
        if lines is not None:
            for line in lines:
                x1,y1,x2,y2 = line.reshape(4)
                if (x2-x1)==0 or abs((y2-y1)/(x2-x1)) > 0.1:
                    m = (x2-x1)/(y2-y1)
                    p_y = int(self.error_p[1]*h)
                    p_x = int(x1 + (p_y-y1)*m)
                    if p_x < w/2:
                        if p_x < int((self.error_p[0]+self.error_w)*w) and p_x > int(self.error_p[0]*w):
                            left.append(p_x)
                    else:
                        if p_x < int((1-self.error_p[0])*w) and p_x > int((1-self.error_p[0]-self.error_w)*w):
                            right.append(p_x)
                else:
                    if abs(x1-x2)>w/10 and y1>0.8*h:
                        # print(x1,y1,x2,y2)
                        # print(len(lines))
                        self.stopline = True
        if len(left) == 0:
            left_lane = 0
        else:
            left_lane = np.mean(left)
        if len(right) == 0:
            right_lane = w
        else:
            right_lane = np.mean(right)
        # print("time used: ", time.time()-t1)
        center = (left_lane+right_lane)/2
        if show:
            cv2.line(image,(int(center),int(image.shape[0])),(int(center),int(0.8*image.shape[0])),(255,0,255),5)
            cv2.imshow('center', image)
            cv2.waitKey(1)
        return (left_lane+right_lane)/2

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-method", type=str, default='histogram', help="hough or histogram")
    parser.add_argument("-show", type=str, default=True, help="show camera frames")
    args = parser.parse_args(rospy.myargv()[1:])
    try:
        if args.show=="True":
            s = True
        else:
            s = False
        node = LaneDetector(method=args.method, show = s)
        node.rate.sleep()
        rospy.spin()
    except rospy.ROSInterruptException:
        cv2.destroyAllWindows()