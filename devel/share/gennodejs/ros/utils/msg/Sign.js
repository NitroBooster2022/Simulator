// Auto-generated. Do not edit!

// (in-package utils.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Sign {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.objects = null;
      this.box1 = null;
      this.box2 = null;
      this.box3 = null;
      this.box4 = null;
      this.num = null;
      this.confidence = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('objects')) {
        this.objects = initObj.objects
      }
      else {
        this.objects = [];
      }
      if (initObj.hasOwnProperty('box1')) {
        this.box1 = initObj.box1
      }
      else {
        this.box1 = [];
      }
      if (initObj.hasOwnProperty('box2')) {
        this.box2 = initObj.box2
      }
      else {
        this.box2 = [];
      }
      if (initObj.hasOwnProperty('box3')) {
        this.box3 = initObj.box3
      }
      else {
        this.box3 = [];
      }
      if (initObj.hasOwnProperty('box4')) {
        this.box4 = initObj.box4
      }
      else {
        this.box4 = [];
      }
      if (initObj.hasOwnProperty('num')) {
        this.num = initObj.num
      }
      else {
        this.num = 0;
      }
      if (initObj.hasOwnProperty('confidence')) {
        this.confidence = initObj.confidence
      }
      else {
        this.confidence = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Sign
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [objects]
    bufferOffset = _arraySerializer.int32(obj.objects, buffer, bufferOffset, null);
    // Serialize message field [box1]
    bufferOffset = _arraySerializer.float32(obj.box1, buffer, bufferOffset, null);
    // Serialize message field [box2]
    bufferOffset = _arraySerializer.float32(obj.box2, buffer, bufferOffset, null);
    // Serialize message field [box3]
    bufferOffset = _arraySerializer.float32(obj.box3, buffer, bufferOffset, null);
    // Serialize message field [box4]
    bufferOffset = _arraySerializer.float32(obj.box4, buffer, bufferOffset, null);
    // Serialize message field [num]
    bufferOffset = _serializer.int32(obj.num, buffer, bufferOffset);
    // Serialize message field [confidence]
    bufferOffset = _arraySerializer.float32(obj.confidence, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Sign
    let len;
    let data = new Sign(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [objects]
    data.objects = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [box1]
    data.box1 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [box2]
    data.box2 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [box3]
    data.box3 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [box4]
    data.box4 = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [num]
    data.num = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [confidence]
    data.confidence = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.objects.length;
    length += 4 * object.box1.length;
    length += 4 * object.box2.length;
    length += 4 * object.box3.length;
    length += 4 * object.box4.length;
    length += 4 * object.confidence.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'utils/Sign';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b9c82d37a6d896a910746afbdbd99b7a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    int32[] objects
    float32[] box1
    float32[] box2
    float32[] box3
    float32[] box4
    int32 num
    float32[] confidence
    # int32 obj1
    # float32 left1
    # float32 top1
    # float32 width1
    # float32 height1
    
    # int32 obj2
    # float32 left2
    # float32 top2
    # float32 width2
    # float32 height2
    
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Sign(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.objects !== undefined) {
      resolved.objects = msg.objects;
    }
    else {
      resolved.objects = []
    }

    if (msg.box1 !== undefined) {
      resolved.box1 = msg.box1;
    }
    else {
      resolved.box1 = []
    }

    if (msg.box2 !== undefined) {
      resolved.box2 = msg.box2;
    }
    else {
      resolved.box2 = []
    }

    if (msg.box3 !== undefined) {
      resolved.box3 = msg.box3;
    }
    else {
      resolved.box3 = []
    }

    if (msg.box4 !== undefined) {
      resolved.box4 = msg.box4;
    }
    else {
      resolved.box4 = []
    }

    if (msg.num !== undefined) {
      resolved.num = msg.num;
    }
    else {
      resolved.num = 0
    }

    if (msg.confidence !== undefined) {
      resolved.confidence = msg.confidence;
    }
    else {
      resolved.confidence = []
    }

    return resolved;
    }
};

module.exports = Sign;
