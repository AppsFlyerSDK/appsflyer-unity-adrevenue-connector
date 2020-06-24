package com.appsflyer.unity.afunityadrevenueplugin;

import android.app.Application;
import com.appsflyer.adrevenue.AppsFlyerAdRevenue;
import com.appsflyer.adrevenue.adnetworks.AppsFlyerAdRevenueWrapperType;

public class AdRevenueUnityWrapper {

    /**
     * Start - currently we only support MoPub
     * In the future we will support more AppsFlyerAdRevenueWrapperTypes
     * @param application
     */
    public static void start(Application application) {
        AppsFlyerAdRevenue.initialize(new AppsFlyerAdRevenue.Builder(application)
                .addNetworks(AppsFlyerAdRevenueWrapperType.MOPUB)
                .build());
        AppsFlyerAdRevenue.moPubWrapper().recordImpressionData();
    }

}
