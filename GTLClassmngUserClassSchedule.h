/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2016 Google Inc.
 */

//
//  GTLClassmngUserClassSchedule.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   classmng/v1
// Description:
//   This is an API
// Classes:
//   GTLClassmngUserClassSchedule (0 custom class methods, 2 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

@class GTLClassmngClassScheduleItem;
@class GTLClassmngUserMessage;

// ----------------------------------------------------------------------------
//
//   GTLClassmngUserClassSchedule
//

@interface GTLClassmngUserClassSchedule : GTLObject
@property (nonatomic, retain) NSArray *registeredCourses;  // of GTLClassmngClassScheduleItem

// ProtoRPC container for users.User objects. Attributes: email: String; The
// email of the user. auth_domain: String; The auth domain of the user. user_id:
// String; The user ID. federated_identity: String; The federated identity of
// the user.
@property (nonatomic, retain) GTLClassmngUserMessage *user;

@end
