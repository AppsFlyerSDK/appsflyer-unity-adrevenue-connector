package com.appsflyer.unity.afunityadrevenueplugin;

import android.app.Application;
import com.appsflyer.adrevenue.AppsFlyerAdRevenue;
import com.appsflyer.adrevenue.adnetworks.AppsFlyerAdRevenueWrapperType;
import com.appsflyer.adrevenue.adnetworks.generic.MediationNetwork;

import java.util.Currency;
import java.util.HashMap;

public class AdRevenueUnityWrapper {

    /**
     * Start - currently we only support MoPub
     * In the future we will support more AppsFlyerAdRevenueWrapperTypes
     *
     * @param application
     */
    public static void start(Application application,int lenght, int... AdRevenueTypes) {
        AppsFlyerAdRevenue.initialize(new AppsFlyerAdRevenue.Builder(application)
                .build());
        if (lenght > 0) {
            for (int i = 0; i < lenght;  i++) {
                setAppsFlyerAdRevenueType(AdRevenueTypes[i]);
            }
        }
    }

    private static void setAppsFlyerAdRevenueType(int type) {
        switch (type) {
            case 1:
                AppsFlyerAdRevenue.moPubWrapper().recordImpressionData();
                break;
            default:
                return;
        }
    }

    public static void logAdRevenue(String monetizationNetwork,
                                    int mediationNetwork,
                                    String eventRevenueCurrency,
                                    double eventRevenue,
                                    HashMap<String, String> nonMandatory) {
        Currency currency = Currency.getInstance(eventRevenueCurrency);
        AppsFlyerAdRevenue.logAdRevenue(monetizationNetwork,
                                        MediationNetwork.values()[mediationNetwork],
                                        currency,
                                        eventRevenue,
                                        nonMandatory);
    }
}
