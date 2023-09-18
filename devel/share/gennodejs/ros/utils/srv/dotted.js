// Auto-generated. Do not edit!

// (in-package utils.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class dottedRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.req = null;
    }
    else {
      if (initObj.hasOwnProperty('req')) {
        this.req = initObj.req
      }
      else {
        this.req = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type dottedRequest
    // Serialize message field [req]
    bufferOffset = _serializer.string(obj.req, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type dottedRequest
    let len;
    let data = new dottedRequest(null);
    // Deserialize message field [req]
    data.req = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.req);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'utils/dottedRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b8dc53fbc3707f169aa5dbf7b19d2567';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string req
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new dottedRequest(null);
    if (msg.req !== undefined) {
      resolved.req = msg.req;
    }
    else {
      resolved.req = ''
    }

    return resolved;
    }
};

class dottedResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.dotted = null;
    }
    else {
      if (initObj.hasOwnProperty('dotted')) {
        this.dotted = initObj.dotted
      }
      else {
        this.dotted = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type dottedResponse
    // Serialize message field [dotted]
    bufferOffset = _serializer.bool(obj.dotted, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type dottedResponse
    let len;
    let data = new dottedResponse(null);
    // Deserialize message field [dotted]
    data.dotted = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'utils/dottedResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5c459471f396960cd81d365321f8af6f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool dotted
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new dottedResponse(null);
    if (msg.dotted !== undefined) {
      resolved.dotted = msg.dotted;
    }
    else {
      resolved.dotted = false
    }

    return resolved;
    }
};

module.exports = {
  Request: dottedRequest,
  Response: dottedResponse,
  md5sum() { return 'e314c20a3feea19c202c5fb6355f6614'; },
  datatype() { return 'utils/dotted'; }
};
