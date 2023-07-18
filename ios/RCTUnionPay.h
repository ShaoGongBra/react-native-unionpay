#import <Foundation/Foundation.h>

#import <React/RCTBridgeModule.h>
#import <React/RCTLog.h>
#import <React/RCTEventDispatcher.h>
#import "UPPaymentControl.h"
#define URL_SCHEMES_NOT_DEFINED (@"URL scheme is not defined!")
#define START_PAY_FAILED (@"start pay failed")

@interface RCTUnionPay : NSObject <RCTBridgeModule>
@property NSString* schemeStr;
@property RCTPromiseResolveBlock payResolve;
@end
