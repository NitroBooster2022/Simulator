// Auto-generated. Do not edit!

// (in-package utils.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ImgInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.colorImg = null;
      this.depImg = null;
    }
    else {
      if (initObj.hasOwnProperty('colorImg')) {
        this.colorImg = initObj.colorImg
      }
      else {
        this.colorImg = [];
      }
      if (initObj.hasOwnProperty('depImg')) {
        this.depImg = initObj.depImg
      }
      else {
        this.depImg = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImgInfo
    // Serialize message field [colorImg]
    bufferOffset = _arraySerializer.uint32(obj.colorImg, buffer, bufferOffset, null);
    // Serialize message field [depImg]
    bufferOffset = _arraySerializer.uint32(obj.depImg, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImgInfo
    let len;
    let data = new ImgInfo(null);
    // Deserialize message field [colorImg]
    data.colorImg = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [depImg]
    data.depImg = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.colorImg.length;
    length += 4 * object.depImg.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'utils/ImgInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '40615b7689d240b97498f576ebe96a97';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32[] colorImg
    uint32[] depImg
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImgInfo(null);
    if (msg.colorImg !== undefined) {
      resolved.colorImg = msg.colorImg;
    }
    else {
      resolved.colorImg = []
    }

    if (msg.depImg !== undefined) {
      resolved.depImg = msg.depImg;
    }
    else {
      resolved.depImg = []
    }

    return resolved;
    }
};

module.exports = ImgInfo;
