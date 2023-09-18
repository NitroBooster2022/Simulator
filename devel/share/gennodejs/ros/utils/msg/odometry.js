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

class odometry {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.odomX = null;
      this.odomY = null;
      this.odomYaw = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('odomX')) {
        this.odomX = initObj.odomX
      }
      else {
        this.odomX = 0.0;
      }
      if (initObj.hasOwnProperty('odomY')) {
        this.odomY = initObj.odomY
      }
      else {
        this.odomY = 0.0;
      }
      if (initObj.hasOwnProperty('odomYaw')) {
        this.odomYaw = initObj.odomYaw
      }
      else {
        this.odomYaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type odometry
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [odomX]
    bufferOffset = _serializer.float32(obj.odomX, buffer, bufferOffset);
    // Serialize message field [odomY]
    bufferOffset = _serializer.float32(obj.odomY, buffer, bufferOffset);
    // Serialize message field [odomYaw]
    bufferOffset = _serializer.float32(obj.odomYaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type odometry
    let len;
    let data = new odometry(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [odomX]
    data.odomX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [odomY]
    data.odomY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [odomYaw]
    data.odomYaw = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'utils/odometry';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5a51da1ea6b66db5cbffc01f7341d40f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    float32 odomX
    float32 odomY
    float32 odomYaw
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
    const resolved = new odometry(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.odomX !== undefined) {
      resolved.odomX = msg.odomX;
    }
    else {
      resolved.odomX = 0.0
    }

    if (msg.odomY !== undefined) {
      resolved.odomY = msg.odomY;
    }
    else {
      resolved.odomY = 0.0
    }

    if (msg.odomYaw !== undefined) {
      resolved.odomYaw = msg.odomYaw;
    }
    else {
      resolved.odomYaw = 0.0
    }

    return resolved;
    }
};

module.exports = odometry;
