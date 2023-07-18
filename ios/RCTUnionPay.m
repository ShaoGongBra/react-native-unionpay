#import "RCTUnionPay.h"

@implementation RCTUnionPay

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();


- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleOpenURL:) name:@"RCTOpenURLNotification" object:nil];
    }

        self.schemeStr = nil;
        NSArray *urlTypes = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleURLTypes"];
        NSArray *urlSchemes = [urlTypes.firstObject objectForKey:@"CFBundleURLSchemes"];
        if(urlSchemes.count > 0) {
            self.schemeStr = [urlSchemes firstObject];
        }
        return self;
    }
    - (void)dealloc
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    
    - (BOOL)handleOpenURL:(NSNotification *)notification
    {
        NSString * aURLString =  [notification userInfo][@"url"];
        NSURL * url = [NSURL URLWithString:aURLString];
        NSArray *schemes = [NSArray arrayWithObjects:@"duxapp", @"uppaysdk", @"uppaywallet", @"uppayx1", @"uppayx2", @"uppayx3", self.schemeStr, nil];
        BOOL canOpen = false;
        for (NSString *scheme in schemes) {
            canOpen = [aURLString hasPrefix:scheme];
            if (canOpen) break;
        }
        if (canOpen) {
            [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
                
                NSMutableDictionary *body = [[NSMutableDictionary alloc] init];
                if(data != nil) {
                    body = [data mutableCopy];
                }
                //body = @{@"code" : code};
                [body setObject:code forKey:@"code"];
                
                if(self.payResolve) {
                    self.payResolve(@{
                        @"code": code
                    });
                }
                
                
            }];
        }
        return canOpen;
    }
    
    RCT_EXPORT_METHOD(startPay:(NSString *)tn mode:(NSString*)mode resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
    {
        if(self.schemeStr == nil) {
            resolve(@{
                @"code": URL_SCHEMES_NOT_DEFINED
            });
            return;
        }
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        UIViewController *rootViewController = window.rootViewController;
        Boolean result = [[UPPaymentControl defaultControl] startPay:tn fromScheme:self.schemeStr mode:mode viewController:rootViewController];
        if(!result) {
            resolve(@{
                @"code": @"fail"
            });
        }
        self.payResolve = resolve;
        
    }
    RCT_EXPORT_METHOD(isAppInstalled:(NSString *)mode
                      withMerchantInfo:(NSString *)withMerchantInfo
                      resolve:(RCTPromiseResolveBlock)resolve
                      reject:(RCTPromiseRejectBlock)reject)
    {
        Boolean result = [[UPPaymentControl defaultControl] isPaymentAppInstalled:mode withMerchantInfo:withMerchantInfo];

        resolve(@(result));
    }
    @end
