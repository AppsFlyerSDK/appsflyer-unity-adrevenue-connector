using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;

namespace AppsFlyerSDK
{
    public class AppsFlyerAdRevenue : MonoBehaviour
    {

        public static readonly string kAppsFlyerAdRevenueVersion = "6.4.2";

#if UNITY_ANDROID && !UNITY_EDITOR
        private static AndroidJavaClass appsFlyerAndroid = new AndroidJavaClass("com.appsflyer.unity.afunityadrevenueplugin.AdRevenueUnityWrapper");
#endif

        public static void start(params AppsFlyerAdRevenueType[] adRevenueType)
        {

#if UNITY_IOS && !UNITY_EDITOR

        _start(adRevenueType.Length, adRevenueType);

#elif UNITY_ANDROID && !UNITY_EDITOR
        if (adRevenueType == MoPub) {

                using(AndroidJavaClass cls_UnityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer")) {

                using(AndroidJavaObject cls_Activity = cls_UnityPlayer.GetStatic<AndroidJavaObject>("currentActivity")) {

                    AndroidJavaObject cls_Application = cls_Activity.Call<AndroidJavaObject>("getApplication");

                    appsFlyerAndroid.CallStatic("start", cls_Application); 
                }
            } 
        } else if (adRevenueType == Generic) {
                using(AndroidJavaClass cls_UnityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer")) {

                using(AndroidJavaObject cls_Activity = cls_UnityPlayer.GetStatic<AndroidJavaObject>("currentActivity")) {

                    AndroidJavaObject cls_Application = cls_Activity.Call<AndroidJavaObject>("getApplication");

                    appsFlyerAndroid.CallStatic("startGeneric", cls_Application); 
                }
            }   
        }
           

#else

#endif
        }

        public static void setIsDebug(bool isDebug)
        {
#if UNITY_IOS && !UNITY_EDITOR
        _setIsDebugAdrevenue(isDebug);
#elif UNITY_ANDROID && !UNITY_EDITOR

#else

#endif
        }

        public static void logAdRevenue(string monetizationNetwork, AppsFlyerAdRevenueMediationNetworkType mediationNetwork, float eventRevenue, string revenueCurrency, Dictionary<string, string> additionalParameters)
        {
#if UNITY_IOS && !UNITY_EDITOR

        _logAdRevenue(MonetizationNetwork, mediationNetwork, eventRevenue, revenueCurrency, additionalParameters);

#elif UNITY_ANDROID && !UNITY_EDITOR

        appsFlyerAndroid.CallStatic("logAdRevenue", monetizationNetwork, setMediationNetworkType(mediationNetwork), eventRevenueCurrency, eventRevenue, nonMandatory); 
  
        }
#else

#endif  
        }

#if UNITY_IOS && !UNITY_EDITOR
        
    [DllImport("__Internal")]
    private static extern void _start(int length, params AppsFlyerAdRevenueType[] adRevenueType);

    [DllImport("__Internal")]
    private static extern void _setIsDebugAdrevenue(bool isDebug);

    [DllImport("__Internal")]
    private static extern void _logAdRevenue(const char* monetizationNetwork, int mediationNetwork, double eventRevenue, const char* revenueCurrency, const char** additionalParameters);

#elif UNITY_ANDROID && !UNITY_EDITOR

#else

#endif

    }

    public static integer setMediationNetworkType(AppsFlyerAdRevenueMediationNetworkType mediationNetwork)
    {
            switch (mediationNetwork)
            {
                case AppsFlyerAdRevenueMediationNetworkTypeNone:
                    return -1;
                case AppsFlyerAdRevenueMediationNetworkTypeIronSource:
                        return 0;
                case AppsFlyerAdRevenueMediationNetworkTypeApplovinMax:
                        return 1;
                case AppsFlyerAdRevenueMediationNetworkTypeGoogleAdMob:
                        return 2;
                case AppsFlyerAdRevenueMediationNetworkTypeMoPub:
                        return 3;
                case AppsFlyerAdRevenueMediationNetworkTypeFyber:
                        return 4;
                case AppsFlyerAdRevenueMediationNetworkTypeAppodeal:
                        return 5;
                case AppsFlyerAdRevenueMediationNetworkTypeAdmost:
                        return 6;
                case AppsFlyerAdRevenueMediationNetworkTypeTopon:
                        return 7;
                case AppsFlyerAdRevenueMediationNetworkTypeTopon:
                        return 8;
                case AppsFlyerAdRevenueMediationNetworkTypeTradplus:
                        return 9;
                case AppsFlyerAdRevenueMediationNetworkTypeYandex:
                        return 10;
                default:
                        return -1;
            }

    }

    public enum AppsFlyerAdRevenueType
    {
        Generic = 0,
        MoPub = 1
      
    }

        public enum AppsFlyerAdRevenueMediationNetworkType
    {
        AppsFlyerAdRevenueMediationNetworkTypeNone = 0,
        AppsFlyerAdRevenueMediationNetworkTypeGoogleAdMob = 1,
        AppsFlyerAdRevenueMediationNetworkTypeMoPub = 2,
        AppsFlyerAdRevenueMediationNetworkTypeIronSource = 3,
        AppsFlyerAdRevenueMediationNetworkTypeApplovinMax = 4,
        AppsFlyerAdRevenueMediationNetworkTypeFyber = 5,
        AppsFlyerAdRevenueMediationNetworkTypeAppodeal = 6,
        AppsFlyerAdRevenueMediationNetworkTypeAdmost = 7,
        AppsFlyerAdRevenueMediationNetworkTypeTopon = 8,
        AppsFlyerAdRevenueMediationNetworkTypeTradplus = 9,
        AppsFlyerAdRevenueMediationNetworkTypeYandex =10

    }

}