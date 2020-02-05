//
//  AppsFlyerAdRevenueWrapper.mm
//  Unity-iPhone
//
//  Created by Jonathan Wesfield on 25/11/2019.
//

#import "AppsFlyerAdRevenueWrapper.h"

static bool AdRevenueTypeMoPub = NO;
static BOOL AdRevenueTypeUnityAds = NO;
static BOOL AdRevenueTypeFacebookAudience = NO;
static BOOL AdRevenueTypeGoogleAdMob = NO;
static BOOL AdRevenueTypeAppLovin = NO;

@implementation AppsFlyerAdRevenueWrapper

+ (BOOL) isMoPubSet { return AdRevenueTypeMoPub; }
+ (BOOL) isUnityAdsSet { return AdRevenueTypeUnityAds; }
+ (BOOL) isFacebookAudienceSet { return AdRevenueTypeFacebookAudience; }
+ (BOOL) isGoogleAdMobSet { return AdRevenueTypeGoogleAdMob; }
+ (BOOL) isAppLovinSet { return AdRevenueTypeAppLovin; }

extern "C" {
    
    void setAppsFlyerAdRevenueType(int type){
        switch (type){
            case 0:
                AdRevenueTypeMoPub = YES;
                break;
            case 1:
                AdRevenueTypeUnityAds = YES;
                break;
            case 2:
                AdRevenueTypeFacebookAudience = YES;
                break;
            case 3:
                AdRevenueTypeGoogleAdMob = YES;
                break;
            case 4:
                AdRevenueTypeAppLovin = YES;
                break;
            default:
                break;
        }
    }
    
    const void _start(int length, int* adRevenueType){
        if(length > 0 && adRevenueType) {
            for(int i = 0; i < length; i++) {
                setAppsFlyerAdRevenueType(adRevenueType[i]);
            }
        }
        
        [AppsFlyerAdRevenue start];
    }
    const void _setIsDebug(bool isDebug){
        [[AppsFlyerAdRevenue shared] setIsDebug:isDebug];
    }
}

@end
