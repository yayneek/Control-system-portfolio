// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from tutorial_interfaces:action/DrawShape.idl
// generated code does not contain a copyright notice

#ifndef TUTORIAL_INTERFACES__ACTION__DETAIL__DRAW_SHAPE__STRUCT_H_
#define TUTORIAL_INTERFACES__ACTION__DETAIL__DRAW_SHAPE__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Include directives for member types
// Member 'shape_to_draw'
#include "rosidl_runtime_c/string.h"

/// Struct defined in action/DrawShape in the package tutorial_interfaces.
typedef struct tutorial_interfaces__action__DrawShape_Goal
{
  double time_of_motion;
  rosidl_runtime_c__String shape_to_draw;
  double figure_param;
} tutorial_interfaces__action__DrawShape_Goal;

// Struct for a sequence of tutorial_interfaces__action__DrawShape_Goal.
typedef struct tutorial_interfaces__action__DrawShape_Goal__Sequence
{
  tutorial_interfaces__action__DrawShape_Goal * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} tutorial_interfaces__action__DrawShape_Goal__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'message'
// already included above
// #include "rosidl_runtime_c/string.h"

/// Struct defined in action/DrawShape in the package tutorial_interfaces.
typedef struct tutorial_interfaces__action__DrawShape_Result
{
  bool success;
  rosidl_runtime_c__String message;
} tutorial_interfaces__action__DrawShape_Result;

// Struct for a sequence of tutorial_interfaces__action__DrawShape_Result.
typedef struct tutorial_interfaces__action__DrawShape_Result__Sequence
{
  tutorial_interfaces__action__DrawShape_Result * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} tutorial_interfaces__action__DrawShape_Result__Sequence;


// Constants defined in the message

/// Struct defined in action/DrawShape in the package tutorial_interfaces.
typedef struct tutorial_interfaces__action__DrawShape_Feedback
{
  double percent_complete;
} tutorial_interfaces__action__DrawShape_Feedback;

// Struct for a sequence of tutorial_interfaces__action__DrawShape_Feedback.
typedef struct tutorial_interfaces__action__DrawShape_Feedback__Sequence
{
  tutorial_interfaces__action__DrawShape_Feedback * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} tutorial_interfaces__action__DrawShape_Feedback__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'goal_id'
#include "unique_identifier_msgs/msg/detail/uuid__struct.h"
// Member 'goal'
#include "tutorial_interfaces/action/detail/draw_shape__struct.h"

/// Struct defined in action/DrawShape in the package tutorial_interfaces.
typedef struct tutorial_interfaces__action__DrawShape_SendGoal_Request
{
  unique_identifier_msgs__msg__UUID goal_id;
  tutorial_interfaces__action__DrawShape_Goal goal;
} tutorial_interfaces__action__DrawShape_SendGoal_Request;

// Struct for a sequence of tutorial_interfaces__action__DrawShape_SendGoal_Request.
typedef struct tutorial_interfaces__action__DrawShape_SendGoal_Request__Sequence
{
  tutorial_interfaces__action__DrawShape_SendGoal_Request * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} tutorial_interfaces__action__DrawShape_SendGoal_Request__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'stamp'
#include "builtin_interfaces/msg/detail/time__struct.h"

/// Struct defined in action/DrawShape in the package tutorial_interfaces.
typedef struct tutorial_interfaces__action__DrawShape_SendGoal_Response
{
  bool accepted;
  builtin_interfaces__msg__Time stamp;
} tutorial_interfaces__action__DrawShape_SendGoal_Response;

// Struct for a sequence of tutorial_interfaces__action__DrawShape_SendGoal_Response.
typedef struct tutorial_interfaces__action__DrawShape_SendGoal_Response__Sequence
{
  tutorial_interfaces__action__DrawShape_SendGoal_Response * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} tutorial_interfaces__action__DrawShape_SendGoal_Response__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'goal_id'
// already included above
// #include "unique_identifier_msgs/msg/detail/uuid__struct.h"

/// Struct defined in action/DrawShape in the package tutorial_interfaces.
typedef struct tutorial_interfaces__action__DrawShape_GetResult_Request
{
  unique_identifier_msgs__msg__UUID goal_id;
} tutorial_interfaces__action__DrawShape_GetResult_Request;

// Struct for a sequence of tutorial_interfaces__action__DrawShape_GetResult_Request.
typedef struct tutorial_interfaces__action__DrawShape_GetResult_Request__Sequence
{
  tutorial_interfaces__action__DrawShape_GetResult_Request * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} tutorial_interfaces__action__DrawShape_GetResult_Request__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'result'
// already included above
// #include "tutorial_interfaces/action/detail/draw_shape__struct.h"

/// Struct defined in action/DrawShape in the package tutorial_interfaces.
typedef struct tutorial_interfaces__action__DrawShape_GetResult_Response
{
  int8_t status;
  tutorial_interfaces__action__DrawShape_Result result;
} tutorial_interfaces__action__DrawShape_GetResult_Response;

// Struct for a sequence of tutorial_interfaces__action__DrawShape_GetResult_Response.
typedef struct tutorial_interfaces__action__DrawShape_GetResult_Response__Sequence
{
  tutorial_interfaces__action__DrawShape_GetResult_Response * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} tutorial_interfaces__action__DrawShape_GetResult_Response__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'goal_id'
// already included above
// #include "unique_identifier_msgs/msg/detail/uuid__struct.h"
// Member 'feedback'
// already included above
// #include "tutorial_interfaces/action/detail/draw_shape__struct.h"

/// Struct defined in action/DrawShape in the package tutorial_interfaces.
typedef struct tutorial_interfaces__action__DrawShape_FeedbackMessage
{
  unique_identifier_msgs__msg__UUID goal_id;
  tutorial_interfaces__action__DrawShape_Feedback feedback;
} tutorial_interfaces__action__DrawShape_FeedbackMessage;

// Struct for a sequence of tutorial_interfaces__action__DrawShape_FeedbackMessage.
typedef struct tutorial_interfaces__action__DrawShape_FeedbackMessage__Sequence
{
  tutorial_interfaces__action__DrawShape_FeedbackMessage * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} tutorial_interfaces__action__DrawShape_FeedbackMessage__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // TUTORIAL_INTERFACES__ACTION__DETAIL__DRAW_SHAPE__STRUCT_H_
