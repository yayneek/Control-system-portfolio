// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from tutorial_interfaces:action/DrawShape.idl
// generated code does not contain a copyright notice

#ifndef TUTORIAL_INTERFACES__ACTION__DETAIL__DRAW_SHAPE__BUILDER_HPP_
#define TUTORIAL_INTERFACES__ACTION__DETAIL__DRAW_SHAPE__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "tutorial_interfaces/action/detail/draw_shape__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace tutorial_interfaces
{

namespace action
{

namespace builder
{

class Init_DrawShape_Goal_figure_param
{
public:
  explicit Init_DrawShape_Goal_figure_param(::tutorial_interfaces::action::DrawShape_Goal & msg)
  : msg_(msg)
  {}
  ::tutorial_interfaces::action::DrawShape_Goal figure_param(::tutorial_interfaces::action::DrawShape_Goal::_figure_param_type arg)
  {
    msg_.figure_param = std::move(arg);
    return std::move(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_Goal msg_;
};

class Init_DrawShape_Goal_shape_to_draw
{
public:
  explicit Init_DrawShape_Goal_shape_to_draw(::tutorial_interfaces::action::DrawShape_Goal & msg)
  : msg_(msg)
  {}
  Init_DrawShape_Goal_figure_param shape_to_draw(::tutorial_interfaces::action::DrawShape_Goal::_shape_to_draw_type arg)
  {
    msg_.shape_to_draw = std::move(arg);
    return Init_DrawShape_Goal_figure_param(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_Goal msg_;
};

class Init_DrawShape_Goal_time_of_motion
{
public:
  Init_DrawShape_Goal_time_of_motion()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_DrawShape_Goal_shape_to_draw time_of_motion(::tutorial_interfaces::action::DrawShape_Goal::_time_of_motion_type arg)
  {
    msg_.time_of_motion = std::move(arg);
    return Init_DrawShape_Goal_shape_to_draw(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_Goal msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::tutorial_interfaces::action::DrawShape_Goal>()
{
  return tutorial_interfaces::action::builder::Init_DrawShape_Goal_time_of_motion();
}

}  // namespace tutorial_interfaces


namespace tutorial_interfaces
{

namespace action
{

namespace builder
{

class Init_DrawShape_Result_message
{
public:
  explicit Init_DrawShape_Result_message(::tutorial_interfaces::action::DrawShape_Result & msg)
  : msg_(msg)
  {}
  ::tutorial_interfaces::action::DrawShape_Result message(::tutorial_interfaces::action::DrawShape_Result::_message_type arg)
  {
    msg_.message = std::move(arg);
    return std::move(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_Result msg_;
};

class Init_DrawShape_Result_success
{
public:
  Init_DrawShape_Result_success()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_DrawShape_Result_message success(::tutorial_interfaces::action::DrawShape_Result::_success_type arg)
  {
    msg_.success = std::move(arg);
    return Init_DrawShape_Result_message(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_Result msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::tutorial_interfaces::action::DrawShape_Result>()
{
  return tutorial_interfaces::action::builder::Init_DrawShape_Result_success();
}

}  // namespace tutorial_interfaces


namespace tutorial_interfaces
{

namespace action
{

namespace builder
{

class Init_DrawShape_Feedback_percent_complete
{
public:
  Init_DrawShape_Feedback_percent_complete()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  ::tutorial_interfaces::action::DrawShape_Feedback percent_complete(::tutorial_interfaces::action::DrawShape_Feedback::_percent_complete_type arg)
  {
    msg_.percent_complete = std::move(arg);
    return std::move(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_Feedback msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::tutorial_interfaces::action::DrawShape_Feedback>()
{
  return tutorial_interfaces::action::builder::Init_DrawShape_Feedback_percent_complete();
}

}  // namespace tutorial_interfaces


namespace tutorial_interfaces
{

namespace action
{

namespace builder
{

class Init_DrawShape_SendGoal_Request_goal
{
public:
  explicit Init_DrawShape_SendGoal_Request_goal(::tutorial_interfaces::action::DrawShape_SendGoal_Request & msg)
  : msg_(msg)
  {}
  ::tutorial_interfaces::action::DrawShape_SendGoal_Request goal(::tutorial_interfaces::action::DrawShape_SendGoal_Request::_goal_type arg)
  {
    msg_.goal = std::move(arg);
    return std::move(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_SendGoal_Request msg_;
};

class Init_DrawShape_SendGoal_Request_goal_id
{
public:
  Init_DrawShape_SendGoal_Request_goal_id()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_DrawShape_SendGoal_Request_goal goal_id(::tutorial_interfaces::action::DrawShape_SendGoal_Request::_goal_id_type arg)
  {
    msg_.goal_id = std::move(arg);
    return Init_DrawShape_SendGoal_Request_goal(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_SendGoal_Request msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::tutorial_interfaces::action::DrawShape_SendGoal_Request>()
{
  return tutorial_interfaces::action::builder::Init_DrawShape_SendGoal_Request_goal_id();
}

}  // namespace tutorial_interfaces


namespace tutorial_interfaces
{

namespace action
{

namespace builder
{

class Init_DrawShape_SendGoal_Response_stamp
{
public:
  explicit Init_DrawShape_SendGoal_Response_stamp(::tutorial_interfaces::action::DrawShape_SendGoal_Response & msg)
  : msg_(msg)
  {}
  ::tutorial_interfaces::action::DrawShape_SendGoal_Response stamp(::tutorial_interfaces::action::DrawShape_SendGoal_Response::_stamp_type arg)
  {
    msg_.stamp = std::move(arg);
    return std::move(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_SendGoal_Response msg_;
};

class Init_DrawShape_SendGoal_Response_accepted
{
public:
  Init_DrawShape_SendGoal_Response_accepted()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_DrawShape_SendGoal_Response_stamp accepted(::tutorial_interfaces::action::DrawShape_SendGoal_Response::_accepted_type arg)
  {
    msg_.accepted = std::move(arg);
    return Init_DrawShape_SendGoal_Response_stamp(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_SendGoal_Response msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::tutorial_interfaces::action::DrawShape_SendGoal_Response>()
{
  return tutorial_interfaces::action::builder::Init_DrawShape_SendGoal_Response_accepted();
}

}  // namespace tutorial_interfaces


namespace tutorial_interfaces
{

namespace action
{

namespace builder
{

class Init_DrawShape_GetResult_Request_goal_id
{
public:
  Init_DrawShape_GetResult_Request_goal_id()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  ::tutorial_interfaces::action::DrawShape_GetResult_Request goal_id(::tutorial_interfaces::action::DrawShape_GetResult_Request::_goal_id_type arg)
  {
    msg_.goal_id = std::move(arg);
    return std::move(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_GetResult_Request msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::tutorial_interfaces::action::DrawShape_GetResult_Request>()
{
  return tutorial_interfaces::action::builder::Init_DrawShape_GetResult_Request_goal_id();
}

}  // namespace tutorial_interfaces


namespace tutorial_interfaces
{

namespace action
{

namespace builder
{

class Init_DrawShape_GetResult_Response_result
{
public:
  explicit Init_DrawShape_GetResult_Response_result(::tutorial_interfaces::action::DrawShape_GetResult_Response & msg)
  : msg_(msg)
  {}
  ::tutorial_interfaces::action::DrawShape_GetResult_Response result(::tutorial_interfaces::action::DrawShape_GetResult_Response::_result_type arg)
  {
    msg_.result = std::move(arg);
    return std::move(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_GetResult_Response msg_;
};

class Init_DrawShape_GetResult_Response_status
{
public:
  Init_DrawShape_GetResult_Response_status()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_DrawShape_GetResult_Response_result status(::tutorial_interfaces::action::DrawShape_GetResult_Response::_status_type arg)
  {
    msg_.status = std::move(arg);
    return Init_DrawShape_GetResult_Response_result(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_GetResult_Response msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::tutorial_interfaces::action::DrawShape_GetResult_Response>()
{
  return tutorial_interfaces::action::builder::Init_DrawShape_GetResult_Response_status();
}

}  // namespace tutorial_interfaces


namespace tutorial_interfaces
{

namespace action
{

namespace builder
{

class Init_DrawShape_FeedbackMessage_feedback
{
public:
  explicit Init_DrawShape_FeedbackMessage_feedback(::tutorial_interfaces::action::DrawShape_FeedbackMessage & msg)
  : msg_(msg)
  {}
  ::tutorial_interfaces::action::DrawShape_FeedbackMessage feedback(::tutorial_interfaces::action::DrawShape_FeedbackMessage::_feedback_type arg)
  {
    msg_.feedback = std::move(arg);
    return std::move(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_FeedbackMessage msg_;
};

class Init_DrawShape_FeedbackMessage_goal_id
{
public:
  Init_DrawShape_FeedbackMessage_goal_id()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_DrawShape_FeedbackMessage_feedback goal_id(::tutorial_interfaces::action::DrawShape_FeedbackMessage::_goal_id_type arg)
  {
    msg_.goal_id = std::move(arg);
    return Init_DrawShape_FeedbackMessage_feedback(msg_);
  }

private:
  ::tutorial_interfaces::action::DrawShape_FeedbackMessage msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::tutorial_interfaces::action::DrawShape_FeedbackMessage>()
{
  return tutorial_interfaces::action::builder::Init_DrawShape_FeedbackMessage_goal_id();
}

}  // namespace tutorial_interfaces

#endif  // TUTORIAL_INTERFACES__ACTION__DETAIL__DRAW_SHAPE__BUILDER_HPP_
