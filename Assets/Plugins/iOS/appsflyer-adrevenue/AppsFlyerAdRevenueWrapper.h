//
//  AppsFlyerAdRevenueWrapper.h
//  Unity-iPhone
//
//  Created by Jonathan Wesfield on 01/12/2019.
//

#import <Foundation/Foundation.h>
#import "AppsFlyerAdRevenue.h"

@interface AppsFlyerAdRevenueWrapper : NSObject
+ (BOOL)isMoPubSet;
+ (BOOL)isUnityAdsSet;
+ (BOOL)isFacebookAudienceSet;
+ (BOOL)isGoogleAdMobSet;
+ (BOOL)isAppLovinSet;
@end
