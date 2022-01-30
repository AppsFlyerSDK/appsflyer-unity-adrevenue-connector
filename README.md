<img src="https://www.appsflyer.com/wp-content/uploads/2016/11/logo-1.svg"  width="450">

# appsflyer-unity-adrevenue-plugin

🛠 In order for us to provide optimal support, we would kindly ask you to submit any issues to support@appsflyer.com

*When submitting an issue please specify your AppsFlyer sign-up (account) email , your app ID , production steps, logs, code snippets and any additional relevant information.*

## ❗ Disclaimer❗

For now, the adrevenue connector is working with AppsFlyer-unity-plugin up until v6.4.41

## Table of content

- [Installation](#installation)
- [Initialization](#init-sdk)
- [API](#api) 

## <a id="installation"> 📲 Installation
   
   This plugin requires minimum AppsFlyer Unity plugin version >= 4.22.x.

> ⚠️ There are breaking changes when upgrading from version 1.x to 2.x <br> Starting from v2.x, the plugin uses the The External Dependency Manager for Unity. <br> To support these changes first remove all the files from v1.x and only after that add the v2.x unity package.

1. Clone / download this repository.
2. [Import](https://docs.unity3d.com/Manual/AssetPackages.html) appsflyer-unity-adrevenue-plugin-x.x.x.unitypackage  into your Unity project.
    * Go to Assets >> Import Package >> Custom Package
    * Select appsflyer-unity-adrevenue-plugin-x.x.x.unitypackage.

**Note:** You must have the [AppsFlyer Unity plugin](https://github.com/AppsFlyerSDK/appsflyer-unity-plugin) already in your project. In addition, make sure to init AppsFlyer SDK before AppsFlyerAdRevenue.

## <a id="init-sdk"> 🚀 Initialization

## AdRevenue-Generic
---
From version `6.4.3` of AppsFlyer-AdRevenue, we provide an additional new api that allow you send data from the impression payload to AdRevenue no matter which mediation network you use:

---
```c#
using AppsFlyerSDK;

public class AppsFlyerObjectScript : MonoBehaviour
{
  void Start()
  {
  	AppsFlyerAdRevenue.start(AppsFlyerAdRevenueType.Generic);
  	/* AppsFlyerAdRevenue.setIsDebug(true); */
  }

  ....

    Dictionary<string, string> dic = new Dictionary<string, string>();
    dic.Add("custom", "foo");
    dic.Add("custom_2", "bar");
    dic.Add("af_quantity", "1");
    AppsFlyerAdRevenue.logAdRevenue("facebook", AppsFlyerAdRevenueMediationNetworkType.AppsFlyerAdRevenueMediationNetworkTypeMoPub, 0.026, "USD", dic);
}
```
   
## Mopub
---
```c#
using AppsFlyerSDK;

public class AppsFlyerObjectScript : MonoBehaviour
{
  void Start()
  {
  	AppsFlyerAdRevenue.start(AppsFlyerAdRevenueType.MoPub);
  	/* AppsFlyerAdRevenue.setIsDebug(true); */
  }
}
```

## <a id="api"> 📑 API
  Check out the API [here](/docs/api.md).


**Note:** AppsFlyerAdRevenue currently supports MoPub only
