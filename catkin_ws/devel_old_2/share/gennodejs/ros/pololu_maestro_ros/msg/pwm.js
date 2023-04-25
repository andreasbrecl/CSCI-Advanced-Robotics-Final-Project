// Auto-generated. Do not edit!

// (in-package pololu_maestro_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class pwm {
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
    // Serializes a message object of type pwm
    // Serialize message field [channel]
    bufferOffset = _serializer.uint8(obj.channel, buffer, bufferOffset);
    // Serialize message field [target]
    bufferOffset = _serializer.uint16(obj.target, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type pwm
    let len;
    let data = new pwm(null);
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
    // Returns string type for a message object
    return 'pololu_maestro_ros/pwm';
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
    const resolved = new pwm(null);
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

module.exports = pwm;
