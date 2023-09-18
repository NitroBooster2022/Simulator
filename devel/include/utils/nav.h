// Generated by gencpp from file utils/nav.msg
// DO NOT EDIT!


#ifndef UTILS_MESSAGE_NAV_H
#define UTILS_MESSAGE_NAV_H

#include <ros/service_traits.h>


#include <utils/navRequest.h>
#include <utils/navResponse.h>


namespace utils
{

struct nav
{

typedef navRequest Request;
typedef navResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct nav
} // namespace utils


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::utils::nav > {
  static const char* value()
  {
    return "03b8a544594cfde8979006d334ffaf52";
  }

  static const char* value(const ::utils::nav&) { return value(); }
};

template<>
struct DataType< ::utils::nav > {
  static const char* value()
  {
    return "utils/nav";
  }

  static const char* value(const ::utils::nav&) { return value(); }
};


// service_traits::MD5Sum< ::utils::navRequest> should match
// service_traits::MD5Sum< ::utils::nav >
template<>
struct MD5Sum< ::utils::navRequest>
{
  static const char* value()
  {
    return MD5Sum< ::utils::nav >::value();
  }
  static const char* value(const ::utils::navRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::utils::navRequest> should match
// service_traits::DataType< ::utils::nav >
template<>
struct DataType< ::utils::navRequest>
{
  static const char* value()
  {
    return DataType< ::utils::nav >::value();
  }
  static const char* value(const ::utils::navRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::utils::navResponse> should match
// service_traits::MD5Sum< ::utils::nav >
template<>
struct MD5Sum< ::utils::navResponse>
{
  static const char* value()
  {
    return MD5Sum< ::utils::nav >::value();
  }
  static const char* value(const ::utils::navResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::utils::navResponse> should match
// service_traits::DataType< ::utils::nav >
template<>
struct DataType< ::utils::navResponse>
{
  static const char* value()
  {
    return DataType< ::utils::nav >::value();
  }
  static const char* value(const ::utils::navResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // UTILS_MESSAGE_NAV_H
