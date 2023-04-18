// Generated by gencpp from file phidgets_msgs/EncoderDecimatedSpeed.msg
// DO NOT EDIT!


#ifndef PHIDGETS_MSGS_MESSAGE_ENCODERDECIMATEDSPEED_H
#define PHIDGETS_MSGS_MESSAGE_ENCODERDECIMATEDSPEED_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace phidgets_msgs
{
template <class ContainerAllocator>
struct EncoderDecimatedSpeed_
{
  typedef EncoderDecimatedSpeed_<ContainerAllocator> Type;

  EncoderDecimatedSpeed_()
    : header()
    , avr_speed(0.0)  {
    }
  EncoderDecimatedSpeed_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , avr_speed(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _avr_speed_type;
  _avr_speed_type avr_speed;





  typedef boost::shared_ptr< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> const> ConstPtr;

}; // struct EncoderDecimatedSpeed_

typedef ::phidgets_msgs::EncoderDecimatedSpeed_<std::allocator<void> > EncoderDecimatedSpeed;

typedef boost::shared_ptr< ::phidgets_msgs::EncoderDecimatedSpeed > EncoderDecimatedSpeedPtr;
typedef boost::shared_ptr< ::phidgets_msgs::EncoderDecimatedSpeed const> EncoderDecimatedSpeedConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator1> & lhs, const ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.avr_speed == rhs.avr_speed;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator1> & lhs, const ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace phidgets_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "20fbdbe041b6e052c8c414d50464f125";
  }

  static const char* value(const ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x20fbdbe041b6e052ULL;
  static const uint64_t static_value2 = 0xc8c414d50464f125ULL;
};

template<class ContainerAllocator>
struct DataType< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "phidgets_msgs/EncoderDecimatedSpeed";
  }

  static const char* value(const ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Encoder averaged speed for a channel in a Phidgets High-Speed Encoder board\n"
"Header header\n"
"# Averaged (sliding window) speed estimation [rad/s]\n"
"float64 avr_speed\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.avr_speed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct EncoderDecimatedSpeed_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::phidgets_msgs::EncoderDecimatedSpeed_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "avr_speed: ";
    Printer<double>::stream(s, indent + "  ", v.avr_speed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PHIDGETS_MSGS_MESSAGE_ENCODERDECIMATEDSPEED_H
