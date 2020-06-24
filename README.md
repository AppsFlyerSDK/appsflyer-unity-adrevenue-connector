<img src="https://www.appsflyer.com/wp-content/uploads/2016/11/logo-1.svg"  width="450">

# appsflyer-unity-adrevenue-plugin

🛠 In order for us to provide optimal support, we would kindly ask you to submit any issues to support@appsflyer.com

*When submitting an issue please specify your AppsFlyer sign-up (account) email , your app ID , production steps, logs, code snippets and any additional relevant information.*

## Table of content

- [Installation](#installation)
- [Initialization](#init-sdk)
- [API](#api) 

## <a id="installation"> 📲 Installation
   
   This plugin supports [Unity plugin](https://github.com/AppsFlyerSDK/Unity) version >= 4.22.x

> ⚠️ There are breaking changes when upgrading from version 1.x to 2.x <br> Starting from v2.x, the plugin uses the The External Dependency Manager for Unity. <br> To support these changes first remove all the files from v1.x and only after that add the v2.x unity package.

1. Clone / download this repository.
2. [Import](https://docs.unity3d.com/Manual/AssetPackages.html) appsflyer-unity-adrevenue-plugin-x.x.x.unitypackage  into your Unity project.
    * Go to Assets >> Import Package >> Custom Package
    * Select appsflyer-unity-adrevenue-plugin-x.x.x.unitypackage.

**Note:** You must have the AppsFlyer SDK already in your project. In addition, make sure to init AppsFlyer SDK before AppsFlyerAdRevenue.

## <a id="init-sdk"> 🚀 Initialization

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


**Note:** AppsFlyerAdRevenue currently supports MoPub onl
