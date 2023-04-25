// Auto-generated. Do not edit!

// (in-package pololu_maestro_ros.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class set_servoRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.channel = null;
      this.target = null;
    }
    else {
      if (initObj.hasOwnProperty('channel')) {
        this.channel = initObj.channel
      }
      else {
        this.channel = 0;
      }
      if (initObj.hasOwnProperty('target')) {
        this.target = initObj.target
      }
      else {
        this.target = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type set_servoRequest
    // Serialize message field [channel]
    bufferOffset = _serializer.uint8(obj.channel, buffer, bufferOffset);
    // Serialize message field [target]
    bufferOffset = _serializer.uint16(obj.target, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type set_servoRequest
    let len;
    let data = new set_servoRequest(null);
    // Deserialize message field [channel]
    data.channel = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [target]
    data.target = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 3;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pololu_maestro_ros/set_servoRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cacdc30924dce4f90463bf4f4695d124';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 channel
    uint16 target
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new set_servoRequest(null);
    if (msg.channel !== undefined) {
      resolved.channel = msg.channel;
    }
    else {
      resolved.channel = 0
    }

    if (msg.target !== undefined) {
      resolved.target = msg.target;
    }
    else {
      resolved.target = 0
    }

    return resolved;
    }
};

class set_servoResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type set_servoResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type set_servoResponse
    let len;
    let data = new set_servoResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pololu_maestro_ros/set_servoResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new set_servoResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: set_servoRequest,
  Response: set_servoResponse,
  md5sum() { return 'cacdc30924dce4f90463bf4f4695d124'; },
  datatype() { return 'pololu_maestro_ros/set_servo'; }
};
