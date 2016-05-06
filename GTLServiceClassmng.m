/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2016 Google Inc.
 */

//
//  GTLServiceClassmng.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   classmng/v1
// Description:
//   This is an API
// Classes:
//   GTLServiceClassmng (0 custom class methods, 0 custom properties)

#import "GTLClassmng.h"

@implementation GTLServiceClassmng

#if DEBUG
// Method compiled in debug builds just to check that all the needed support
// classes are present at link time.
+ (NSArray *)checkClasses {
  NSArray *classes = @[
    [GTLQueryClassmng class],
    [GTLClassmngClassScheduleItem class],
    [GTLClassmngUserClassSchedule class],
    [GTLClassmngUserMessage class]
  ];
  return classes;
}
#endif  // DEBUG

- (instancetype)init {
  self = [super init];
  if (self) {
    // Version from discovery.
    self.apiVersion = @"v1";

    // From discovery.  Where to send JSON-RPC.
    // Turn off prettyPrint for this service to save bandwidth (especially on
    // mobile). The fetcher logging will pretty print.
    self.rpcURL = [NSURL URLWithString:@"https://gypgae3.appspot.com/_ah/api/rpc?prettyPrint=false"];
  }
  return self;
}

@end
