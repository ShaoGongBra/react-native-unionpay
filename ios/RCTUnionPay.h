#import <Foundation/Foundation.h>

#import "React/RCTBridgeModule.h"
#import "RCTLog.h"
#import "RCTEventDispatcher.h"
#import "RCTEventEmitter.h"
#import "UPPaymentControl.h"
#define URL_SCHEMES_NOT_DEFINED (@"URL scheme is not defined!")
#define START_PAY_FAILED (@"start pay failed")

@interface RCTUnionPay : RCTEventEmitter <RCTBridgeModule>
@property NSString* schemeStr;
@end