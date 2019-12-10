//
//  MoPubAdrevenueAppsFlyerWrapper.mm
//  Unity-iPhone
//
//  Created by Jonathan Wesfield on 30/11/2019.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#if __has_include("MoPubManager.h")
#import "MoPubManager.h"
#endif

#if __has_include("AppsFlyerAdRevenue.h")
#import "AppsFlyerAdRevenue.h"
#endif

#if __has_include("AppsFlyerAdRevenueWrapper.h")
#import "AppsFlyerAdRevenueWrapper.h"
#endif

#ifdef MoPubKit
@implementation MPInterstitialAdController(AppsFlyerAdRevenueProxy)

- (void)setDelegate:(id)outerDelegate {
    
    Ivar ivarInfo = class_getInstanceVariable([self class], [@"_delegate" UTF8String]);
    if (ivarInfo == NULL) {
        NSLog(@"MoPub delegate method not found! Wrong MoPub/Adrevenue version(not compatible)");
    }
    id delegate = outerDelegate;
    // anyDelegate cannot receive a nil
    if (outerDelegate && [AppsFlyerAdRevenueWrapper isMoPubSet]) {
        [AppsFlyerAdRevenue start];
        delegate = [[AppsFlyerAdRevenue shared] anyDelegate:outerDelegate adNetworkType:AFADRMoPubAdNetworkType];
    }
    // if we have gotten a nil from outerDelegate - we have to set it also
    object_setIvar(self, ivarInfo, delegate);
}

@end

@implementation MPAdView(AppsFlyerAdRevenueProxy)

- (void)setDelegate:(id)outerDelegate {
    
    
        
    Ivar ivarInfo = class_getInstanceVariable([self class], [@"_delegate" UTF8String]);
    if (ivarInfo == NULL) {
        NSLog(@"MoPub delegate method not found! Wrong MoPub/Adrevenue version(not compatible)");
    }
    id delegate = outerDelegate;
    // anyDelegate cannot receive a nil
    if (outerDelegate && [AppsFlyerAdRevenueWrapper isMoPubSet]) {
        [AppsFlyerAdRevenue start];
        delegate = [[AppsFlyerAdRevenue shared] anyDelegate:outerDelegate adNetworkType:AFADRMoPubAdNetworkType];
    }
    // if we have gotten a nil from outerDelegate - we have to set it also
    object_setIvar(self, ivarInfo, delegate);
    
}

@end

@implementation MPRewardedVideo(AppsFlyerAdRevenueProxy)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = object_getClass((id)self);
        SEL originalSelector = @selector(setDelegate:forAdUnitId:);
        SEL swizzledSelector = @selector(adrevenue_setDelegate:forAdUnitId:);
        Method originalMethod = class_getClassMethod(cls, originalSelector);
        Method swizzledMethod = class_getClassMethod(cls, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
});
}

+ (void)adrevenue_setDelegate:(id)delegate forAdUnitId:(id)adUnitId {
    [AppsFlyerAdRevenue start];
    id AdRevenueDelegate = [[AppsFlyerAdRevenue shared] anyDelegate:delegate adNetworkType:AFADRMoPubAdNetworkType];
    [self adrevenue_setDelegate:AdRevenueDelegate forAdUnitId:adUnitId];
}


@end

#endif

