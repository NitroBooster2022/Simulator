import serial

def speed(f_velocity):
    return "#{0}:{1:.2f};;\r\n".format(1, f_velocity)

def steer(f_angle):
    return "#{0}:{1:.2f};;\r\n".format(2, f_angle)

def main():
    serial_port = serial.Serial('/dev/ttyACM0', baudrate=19200)

    speed_msg = speed(10.0)
    print("speed msg sent:", speed_msg)
    serial_port.write(speed_msg.encode())

    steer_msg = steer(10.0)
    print("steer msg sent:", steer_msg)
    serial_port.write(steer_msg.encode())

    serial_port.close()

if __name__ == "__main__":
    main()
