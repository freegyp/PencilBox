/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2016 Google Inc.
 */

//
//  GTLScheduleUserMessage.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   schedule/v1
// Description:
//   This is an API
// Classes:
//   GTLScheduleUserMessage (0 custom class methods, 4 custom properties)

#import "GTLScheduleUserMessage.h"

// ----------------------------------------------------------------------------
//
//   GTLScheduleUserMessage
//

@implementation GTLScheduleUserMessage
@dynamic authDomain, email, federatedIdentity, userId;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map = @{
    @"authDomain" : @"auth_domain",
    @"federatedIdentity" : @"federated_identity",
    @"userId" : @"user_id"
  };
  return map;
}

@end
