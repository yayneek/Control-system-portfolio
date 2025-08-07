// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from tutorial_interfaces:srv/GripperControl.idl
// generated code does not contain a copyright notice

#ifndef TUTORIAL_INTERFACES__SRV__DETAIL__GRIPPER_CONTROL__BUILDER_HPP_
#define TUTORIAL_INTERFACES__SRV__DETAIL__GRIPPER_CONTROL__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "tutorial_interfaces/srv/detail/gripper_control__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace tutorial_interfaces
{

namespace srv
{

namespace builder
{

class Init_GripperControl_Request_state
{
public:
  Init_GripperControl_Request_state()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  ::tutorial_interfaces::srv::GripperControl_Request state(::tutorial_interfaces::srv::GripperControl_Request::_state_type arg)
  {
    msg_.state = std::move(arg);
    return std::move(msg_);
  }

private:
  ::tutorial_interfaces::srv::GripperControl_Request msg_;
};

}  // namespace builder

}  // namespace srv

template<typename MessageType>
auto build();

template<>
inline
auto build<::tutorial_interfaces::srv::GripperControl_Request>()
{
  return tutorial_interfaces::srv::builder::Init_GripperControl_Request_state();
}

}  // namespace tutorial_interfaces


namespace tutorial_interfaces
{

namespace srv
{

namespace builder
{

class Init_GripperControl_Response_message
{
public:
  explicit Init_GripperControl_Response_message(::tutorial_interfaces::srv::GripperControl_Response & msg)
  : msg_(msg)
  {}
  ::tutorial_interfaces::srv::GripperControl_Response message(::tutorial_interfaces::srv::GripperControl_Response::_message_type arg)
  {
    msg_.message = std::move(arg);
    return std::move(msg_);
  }

private:
  ::tutorial_interfaces::srv::GripperControl_Response msg_;
};

class Init_GripperControl_Response_success
{
public:
  Init_GripperControl_Response_success()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_GripperControl_Response_message success(::tutorial_interfaces::srv::GripperControl_Response::_success_type arg)
  {
    msg_.success = std::move(arg);
    return Init_GripperControl_Response_message(msg_);
  }

private:
  ::tutorial_interfaces::srv::GripperControl_Response msg_;
};

}  // namespace builder

}  // namespace srv

template<typename MessageType>
auto build();

template<>
inline
auto build<::tutorial_interfaces::srv::GripperControl_Response>()
{
  return tutorial_interfaces::srv::builder::Init_GripperControl_Response_success();
}

}  // namespace tutorial_interfaces

#endif  // TUTORIAL_INTERFACES__SRV__DETAIL__GRIPPER_CONTROL__BUILDER_HPP_
