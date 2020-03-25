# API


- [start](#start)
- [setIsDebug](#setIsDebug)

<hr>

##### <a id="start"> `public static void start(params AppsFlyerAdRevenueType[] adRevenueType)`
  
  Start sending AdRevenue data to AppsFlyer.
  
  *Example:*
  
  ```c#
  
  using AppsFlyerSDK;
    
    void Start()
    {
      AppsFlyerAdRevenue.start(AppsFlyerAdRevenueType.MoPub);
    }
    
  ```
  
| Setting        | type                            |  description                             |
| ---------------|-----------------------------    |------------------------------------------|
| adRevenueType  | params AppsFlyerAdRevenueType[] | AppsFlyerAdRevenueType (MoPub, etc.)  |
  
  
  <hr>
  
##### <a id="setIsDebug"> `public static void setIsDebug(bool isDebug)`
  
  Set to true to view debug logs. (development only!)
  
  *Example:*
  
  ```c#
    AppsFlyerAdRevenue.setIsDebug(true);
  ```

  **Note** this API will only set the debug logs for iOS. For Android the debug logs are controlled by the native SDK.
  To turn on the debug logs on Android call `AppsFlyer.setIsDebug(true);`
  
| Setting | type   |  description                  |
| --------|------- |-------------------------------|
| isDebug | bool   | set true in development only  |
  
