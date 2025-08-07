// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from tutorial_interfaces:action/DrawShape.idl
// generated code does not contain a copyright notice

#ifndef TUTORIAL_INTERFACES__ACTION__DETAIL__DRAW_SHAPE__STRUCT_HPP_
#define TUTORIAL_INTERFACES__ACTION__DETAIL__DRAW_SHAPE__STRUCT_HPP_

#include <algorithm>
#include <array>
#include <memory>
#include <string>
#include <vector>

#include "rosidl_runtime_cpp/bounded_vector.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


#ifndef _WIN32
# define DEPRECATED__tutorial_interfaces__action__DrawShape_Goal __attribute__((deprecated))
#else
# define DEPRECATED__tutorial_interfaces__action__DrawShape_Goal __declspec(deprecated)
#endif

namespace tutorial_interfaces
{

namespace action
{

// message struct
template<class ContainerAllocator>
struct DrawShape_Goal_
{
  using Type = DrawShape_Goal_<ContainerAllocator>;

  explicit DrawShape_Goal_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->time_of_motion = 0.0;
      this->shape_to_draw = "";
      this->figure_param = 0.0;
    }
  }

  explicit DrawShape_Goal_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : shape_to_draw(_alloc)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->time_of_motion = 0.0;
      this->shape_to_draw = "";
      this->figure_param = 0.0;
    }
  }

  // field types and members
  using _time_of_motion_type =
    double;
  _time_of_motion_type time_of_motion;
  using _shape_to_draw_type =
    std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>;
  _shape_to_draw_type shape_to_draw;
  using _figure_param_type =
    double;
  _figure_param_type figure_param;

  // setters for named parameter idiom
  Type & set__time_of_motion(
    const double & _arg)
  {
    this->time_of_motion = _arg;
    return *this;
  }
  Type & set__shape_to_draw(
    const std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> & _arg)
  {
    this->shape_to_draw = _arg;
    return *this;
  }
  Type & set__figure_param(
    const double & _arg)
  {
    this->figure_param = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator> *;
  using ConstRawPtr =
    const tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_Goal
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_Goal
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const DrawShape_Goal_ & other) const
  {
    if (this->time_of_motion != other.time_of_motion) {
      return false;
    }
    if (this->shape_to_draw != other.shape_to_draw) {
      return false;
    }
    if (this->figure_param != other.figure_param) {
      return false;
    }
    return true;
  }
  bool operator!=(const DrawShape_Goal_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct DrawShape_Goal_

// alias to use template instance with default allocator
using DrawShape_Goal =
  tutorial_interfaces::action::DrawShape_Goal_<std::allocator<void>>;

// constant definitions

}  // namespace action

}  // namespace tutorial_interfaces


#ifndef _WIN32
# define DEPRECATED__tutorial_interfaces__action__DrawShape_Result __attribute__((deprecated))
#else
# define DEPRECATED__tutorial_interfaces__action__DrawShape_Result __declspec(deprecated)
#endif

namespace tutorial_interfaces
{

namespace action
{

// message struct
template<class ContainerAllocator>
struct DrawShape_Result_
{
  using Type = DrawShape_Result_<ContainerAllocator>;

  explicit DrawShape_Result_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->success = false;
      this->message = "";
    }
  }

  explicit DrawShape_Result_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : message(_alloc)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->success = false;
      this->message = "";
    }
  }

  // field types and members
  using _success_type =
    bool;
  _success_type success;
  using _message_type =
    std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>;
  _message_type message;

  // setters for named parameter idiom
  Type & set__success(
    const bool & _arg)
  {
    this->success = _arg;
    return *this;
  }
  Type & set__message(
    const std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> & _arg)
  {
    this->message = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator> *;
  using ConstRawPtr =
    const tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_Result
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_Result
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const DrawShape_Result_ & other) const
  {
    if (this->success != other.success) {
      return false;
    }
    if (this->message != other.message) {
      return false;
    }
    return true;
  }
  bool operator!=(const DrawShape_Result_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct DrawShape_Result_

// alias to use template instance with default allocator
using DrawShape_Result =
  tutorial_interfaces::action::DrawShape_Result_<std::allocator<void>>;

// constant definitions

}  // namespace action

}  // namespace tutorial_interfaces


#ifndef _WIN32
# define DEPRECATED__tutorial_interfaces__action__DrawShape_Feedback __attribute__((deprecated))
#else
# define DEPRECATED__tutorial_interfaces__action__DrawShape_Feedback __declspec(deprecated)
#endif

namespace tutorial_interfaces
{

namespace action
{

// message struct
template<class ContainerAllocator>
struct DrawShape_Feedback_
{
  using Type = DrawShape_Feedback_<ContainerAllocator>;

  explicit DrawShape_Feedback_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->percent_complete = 0.0;
    }
  }

  explicit DrawShape_Feedback_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    (void)_alloc;
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->percent_complete = 0.0;
    }
  }

  // field types and members
  using _percent_complete_type =
    double;
  _percent_complete_type percent_complete;

  // setters for named parameter idiom
  Type & set__percent_complete(
    const double & _arg)
  {
    this->percent_complete = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator> *;
  using ConstRawPtr =
    const tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_Feedback
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_Feedback
    std::shared_ptr<tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const DrawShape_Feedback_ & other) const
  {
    if (this->percent_complete != other.percent_complete) {
      return false;
    }
    return true;
  }
  bool operator!=(const DrawShape_Feedback_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct DrawShape_Feedback_

// alias to use template instance with default allocator
using DrawShape_Feedback =
  tutorial_interfaces::action::DrawShape_Feedback_<std::allocator<void>>;

// constant definitions

}  // namespace action

}  // namespace tutorial_interfaces


// Include directives for member types
// Member 'goal_id'
#include "unique_identifier_msgs/msg/detail/uuid__struct.hpp"
// Member 'goal'
#include "tutorial_interfaces/action/detail/draw_shape__struct.hpp"

#ifndef _WIN32
# define DEPRECATED__tutorial_interfaces__action__DrawShape_SendGoal_Request __attribute__((deprecated))
#else
# define DEPRECATED__tutorial_interfaces__action__DrawShape_SendGoal_Request __declspec(deprecated)
#endif

namespace tutorial_interfaces
{

namespace action
{

// message struct
template<class ContainerAllocator>
struct DrawShape_SendGoal_Request_
{
  using Type = DrawShape_SendGoal_Request_<ContainerAllocator>;

  explicit DrawShape_SendGoal_Request_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : goal_id(_init),
    goal(_init)
  {
    (void)_init;
  }

  explicit DrawShape_SendGoal_Request_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : goal_id(_alloc, _init),
    goal(_alloc, _init)
  {
    (void)_init;
  }

  // field types and members
  using _goal_id_type =
    unique_identifier_msgs::msg::UUID_<ContainerAllocator>;
  _goal_id_type goal_id;
  using _goal_type =
    tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator>;
  _goal_type goal;

  // setters for named parameter idiom
  Type & set__goal_id(
    const unique_identifier_msgs::msg::UUID_<ContainerAllocator> & _arg)
  {
    this->goal_id = _arg;
    return *this;
  }
  Type & set__goal(
    const tutorial_interfaces::action::DrawShape_Goal_<ContainerAllocator> & _arg)
  {
    this->goal = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator> *;
  using ConstRawPtr =
    const tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_SendGoal_Request
    std::shared_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_SendGoal_Request
    std::shared_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Request_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const DrawShape_SendGoal_Request_ & other) const
  {
    if (this->goal_id != other.goal_id) {
      return false;
    }
    if (this->goal != other.goal) {
      return false;
    }
    return true;
  }
  bool operator!=(const DrawShape_SendGoal_Request_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct DrawShape_SendGoal_Request_

// alias to use template instance with default allocator
using DrawShape_SendGoal_Request =
  tutorial_interfaces::action::DrawShape_SendGoal_Request_<std::allocator<void>>;

// constant definitions

}  // namespace action

}  // namespace tutorial_interfaces


// Include directives for member types
// Member 'stamp'
#include "builtin_interfaces/msg/detail/time__struct.hpp"

#ifndef _WIN32
# define DEPRECATED__tutorial_interfaces__action__DrawShape_SendGoal_Response __attribute__((deprecated))
#else
# define DEPRECATED__tutorial_interfaces__action__DrawShape_SendGoal_Response __declspec(deprecated)
#endif

namespace tutorial_interfaces
{

namespace action
{

// message struct
template<class ContainerAllocator>
struct DrawShape_SendGoal_Response_
{
  using Type = DrawShape_SendGoal_Response_<ContainerAllocator>;

  explicit DrawShape_SendGoal_Response_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : stamp(_init)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->accepted = false;
    }
  }

  explicit DrawShape_SendGoal_Response_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : stamp(_alloc, _init)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->accepted = false;
    }
  }

  // field types and members
  using _accepted_type =
    bool;
  _accepted_type accepted;
  using _stamp_type =
    builtin_interfaces::msg::Time_<ContainerAllocator>;
  _stamp_type stamp;

  // setters for named parameter idiom
  Type & set__accepted(
    const bool & _arg)
  {
    this->accepted = _arg;
    return *this;
  }
  Type & set__stamp(
    const builtin_interfaces::msg::Time_<ContainerAllocator> & _arg)
  {
    this->stamp = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator> *;
  using ConstRawPtr =
    const tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_SendGoal_Response
    std::shared_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_SendGoal_Response
    std::shared_ptr<tutorial_interfaces::action::DrawShape_SendGoal_Response_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const DrawShape_SendGoal_Response_ & other) const
  {
    if (this->accepted != other.accepted) {
      return false;
    }
    if (this->stamp != other.stamp) {
      return false;
    }
    return true;
  }
  bool operator!=(const DrawShape_SendGoal_Response_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct DrawShape_SendGoal_Response_

// alias to use template instance with default allocator
using DrawShape_SendGoal_Response =
  tutorial_interfaces::action::DrawShape_SendGoal_Response_<std::allocator<void>>;

// constant definitions

}  // namespace action

}  // namespace tutorial_interfaces

namespace tutorial_interfaces
{

namespace action
{

struct DrawShape_SendGoal
{
  using Request = tutorial_interfaces::action::DrawShape_SendGoal_Request;
  using Response = tutorial_interfaces::action::DrawShape_SendGoal_Response;
};

}  // namespace action

}  // namespace tutorial_interfaces


// Include directives for member types
// Member 'goal_id'
// already included above
// #include "unique_identifier_msgs/msg/detail/uuid__struct.hpp"

#ifndef _WIN32
# define DEPRECATED__tutorial_interfaces__action__DrawShape_GetResult_Request __attribute__((deprecated))
#else
# define DEPRECATED__tutorial_interfaces__action__DrawShape_GetResult_Request __declspec(deprecated)
#endif

namespace tutorial_interfaces
{

namespace action
{

// message struct
template<class ContainerAllocator>
struct DrawShape_GetResult_Request_
{
  using Type = DrawShape_GetResult_Request_<ContainerAllocator>;

  explicit DrawShape_GetResult_Request_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : goal_id(_init)
  {
    (void)_init;
  }

  explicit DrawShape_GetResult_Request_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : goal_id(_alloc, _init)
  {
    (void)_init;
  }

  // field types and members
  using _goal_id_type =
    unique_identifier_msgs::msg::UUID_<ContainerAllocator>;
  _goal_id_type goal_id;

  // setters for named parameter idiom
  Type & set__goal_id(
    const unique_identifier_msgs::msg::UUID_<ContainerAllocator> & _arg)
  {
    this->goal_id = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator> *;
  using ConstRawPtr =
    const tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_GetResult_Request
    std::shared_ptr<tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_GetResult_Request
    std::shared_ptr<tutorial_interfaces::action::DrawShape_GetResult_Request_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const DrawShape_GetResult_Request_ & other) const
  {
    if (this->goal_id != other.goal_id) {
      return false;
    }
    return true;
  }
  bool operator!=(const DrawShape_GetResult_Request_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct DrawShape_GetResult_Request_

// alias to use template instance with default allocator
using DrawShape_GetResult_Request =
  tutorial_interfaces::action::DrawShape_GetResult_Request_<std::allocator<void>>;

// constant definitions

}  // namespace action

}  // namespace tutorial_interfaces


// Include directives for member types
// Member 'result'
// already included above
// #include "tutorial_interfaces/action/detail/draw_shape__struct.hpp"

#ifndef _WIN32
# define DEPRECATED__tutorial_interfaces__action__DrawShape_GetResult_Response __attribute__((deprecated))
#else
# define DEPRECATED__tutorial_interfaces__action__DrawShape_GetResult_Response __declspec(deprecated)
#endif

namespace tutorial_interfaces
{

namespace action
{

// message struct
template<class ContainerAllocator>
struct DrawShape_GetResult_Response_
{
  using Type = DrawShape_GetResult_Response_<ContainerAllocator>;

  explicit DrawShape_GetResult_Response_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : result(_init)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->status = 0;
    }
  }

  explicit DrawShape_GetResult_Response_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : result(_alloc, _init)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->status = 0;
    }
  }

  // field types and members
  using _status_type =
    int8_t;
  _status_type status;
  using _result_type =
    tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator>;
  _result_type result;

  // setters for named parameter idiom
  Type & set__status(
    const int8_t & _arg)
  {
    this->status = _arg;
    return *this;
  }
  Type & set__result(
    const tutorial_interfaces::action::DrawShape_Result_<ContainerAllocator> & _arg)
  {
    this->result = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator> *;
  using ConstRawPtr =
    const tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_GetResult_Response
    std::shared_ptr<tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_GetResult_Response
    std::shared_ptr<tutorial_interfaces::action::DrawShape_GetResult_Response_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const DrawShape_GetResult_Response_ & other) const
  {
    if (this->status != other.status) {
      return false;
    }
    if (this->result != other.result) {
      return false;
    }
    return true;
  }
  bool operator!=(const DrawShape_GetResult_Response_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct DrawShape_GetResult_Response_

// alias to use template instance with default allocator
using DrawShape_GetResult_Response =
  tutorial_interfaces::action::DrawShape_GetResult_Response_<std::allocator<void>>;

// constant definitions

}  // namespace action

}  // namespace tutorial_interfaces

namespace tutorial_interfaces
{

namespace action
{

struct DrawShape_GetResult
{
  using Request = tutorial_interfaces::action::DrawShape_GetResult_Request;
  using Response = tutorial_interfaces::action::DrawShape_GetResult_Response;
};

}  // namespace action

}  // namespace tutorial_interfaces


// Include directives for member types
// Member 'goal_id'
// already included above
// #include "unique_identifier_msgs/msg/detail/uuid__struct.hpp"
// Member 'feedback'
// already included above
// #include "tutorial_interfaces/action/detail/draw_shape__struct.hpp"

#ifndef _WIN32
# define DEPRECATED__tutorial_interfaces__action__DrawShape_FeedbackMessage __attribute__((deprecated))
#else
# define DEPRECATED__tutorial_interfaces__action__DrawShape_FeedbackMessage __declspec(deprecated)
#endif

namespace tutorial_interfaces
{

namespace action
{

// message struct
template<class ContainerAllocator>
struct DrawShape_FeedbackMessage_
{
  using Type = DrawShape_FeedbackMessage_<ContainerAllocator>;

  explicit DrawShape_FeedbackMessage_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : goal_id(_init),
    feedback(_init)
  {
    (void)_init;
  }

  explicit DrawShape_FeedbackMessage_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : goal_id(_alloc, _init),
    feedback(_alloc, _init)
  {
    (void)_init;
  }

  // field types and members
  using _goal_id_type =
    unique_identifier_msgs::msg::UUID_<ContainerAllocator>;
  _goal_id_type goal_id;
  using _feedback_type =
    tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator>;
  _feedback_type feedback;

  // setters for named parameter idiom
  Type & set__goal_id(
    const unique_identifier_msgs::msg::UUID_<ContainerAllocator> & _arg)
  {
    this->goal_id = _arg;
    return *this;
  }
  Type & set__feedback(
    const tutorial_interfaces::action::DrawShape_Feedback_<ContainerAllocator> & _arg)
  {
    this->feedback = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator> *;
  using ConstRawPtr =
    const tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_FeedbackMessage
    std::shared_ptr<tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__tutorial_interfaces__action__DrawShape_FeedbackMessage
    std::shared_ptr<tutorial_interfaces::action::DrawShape_FeedbackMessage_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const DrawShape_FeedbackMessage_ & other) const
  {
    if (this->goal_id != other.goal_id) {
      return false;
    }
    if (this->feedback != other.feedback) {
      return false;
    }
    return true;
  }
  bool operator!=(const DrawShape_FeedbackMessage_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct DrawShape_FeedbackMessage_

// alias to use template instance with default allocator
using DrawShape_FeedbackMessage =
  tutorial_interfaces::action::DrawShape_FeedbackMessage_<std::allocator<void>>;

// constant definitions

}  // namespace action

}  // namespace tutorial_interfaces

#include "action_msgs/srv/cancel_goal.hpp"
#include "action_msgs/msg/goal_info.hpp"
#include "action_msgs/msg/goal_status_array.hpp"

namespace tutorial_interfaces
{

namespace action
{

struct DrawShape
{
  /// The goal message defined in the action definition.
  using Goal = tutorial_interfaces::action::DrawShape_Goal;
  /// The result message defined in the action definition.
  using Result = tutorial_interfaces::action::DrawShape_Result;
  /// The feedback message defined in the action definition.
  using Feedback = tutorial_interfaces::action::DrawShape_Feedback;

  struct Impl
  {
    /// The send_goal service using a wrapped version of the goal message as a request.
    using SendGoalService = tutorial_interfaces::action::DrawShape_SendGoal;
    /// The get_result service using a wrapped version of the result message as a response.
    using GetResultService = tutorial_interfaces::action::DrawShape_GetResult;
    /// The feedback message with generic fields which wraps the feedback message.
    using FeedbackMessage = tutorial_interfaces::action::DrawShape_FeedbackMessage;

    /// The generic service to cancel a goal.
    using CancelGoalService = action_msgs::srv::CancelGoal;
    /// The generic message for the status of a goal.
    using GoalStatusMessage = action_msgs::msg::GoalStatusArray;
  };
};

typedef struct DrawShape DrawShape;

}  // namespace action

}  // namespace tutorial_interfaces

#endif  // TUTORIAL_INTERFACES__ACTION__DETAIL__DRAW_SHAPE__STRUCT_HPP_
