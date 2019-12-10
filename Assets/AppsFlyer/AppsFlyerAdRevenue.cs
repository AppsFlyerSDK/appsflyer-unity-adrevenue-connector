using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;

namespace AppsFlyerSDK
{
    public class AppsFlyerAdRevenue : MonoBehaviour
    {

        public static readonly string kAppsFlyerAdRevenueVersion = "1.0.0";

        public static void start(params AppsFlyerAdRevenueType[] adRevenueType)
        {
#if UNITY_IOS && !UNITY_EDITOR
        _start(adRevenueType.Length, adRevenueType);
#elif UNITY_ANDROID && !UNITY_EDITOR

#else

#endif
        }

        public static void setIsDebug(bool isDebug)
        {
#if UNITY_IOS && !UNITY_EDITOR
        _setIsDebug(isDebug);
#elif UNITY_ANDROID && !UNITY_EDITOR

#else

#endif
        }

#if UNITY_IOS && !UNITY_EDITOR
        
    [DllImport("__Internal")]
    private static extern void _start(int length, params AppsFlyerAdRevenueType[] adRevenueType);

    [DllImport("__Internal")]
    private static extern void _setIsDebug(bool isDebug);

#elif UNITY_ANDROID && !UNITY_EDITOR

#else

#endif

    }

    public enum AppsFlyerAdRevenueType
    {
        MoPub = 0
    }
}