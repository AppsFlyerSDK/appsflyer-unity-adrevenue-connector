package com.appsflyer.unity.afunityadrevenueplugin;

import android.app.Application;
import com.appsflyer.adrevenue.AppsFlyerAdRevenue;
import com.appsflyer.adrevenue.adnetworks.AppsFlyerAdRevenueWrapperType;
import com.appsflyer.adrevenue.adnetworks.generic.MediationNetwork;

import java.util.Currency;
import java.util.Map;

public class AdRevenueUnityWrapper {

    /**
     * Start - currently we only support MoPub
     * In the future we will support more AppsFlyerAdRevenueWrapperTypes
     *
     * @param application
     */
    public static void start(Application application) {
        AppsFlyerAdRevenue.initialize(new AppsFlyerAdRevenue.Builder(application)
                .addNetworks(AppsFlyerAdRevenueWrapperType.MOPUB)
                .build());
        AppsFlyerAdRevenue.moPubWrapper().recordImpressionData();
    }

    public static void startGeneric(Application application) {
        AppsFlyerAdRevenue.initialize(new AppsFlyerAdRevenue.Builder(application)
                .build());
    }

    public static void logAdRevenue(String monetizationNetwork,
                                    int mediationNetwork,
                                    Currency eventRevenueCurrency,
                                    Double eventRevenue,
                                    Map<String, String> nonMandatory) {
        AppsFlyerAdRevenue.logAdRevenue(monetizationNetwork, MediationNetwork.values()[mediationNetwork], eventRevenueCurrency, eventRevenue, nonMandatory);
    }
}
