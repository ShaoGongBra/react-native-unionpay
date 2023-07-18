# react-native-unionpay

云闪付 ReactNative SDK

## 安装

```bash
yarn add @shaogong/react-native-unionpay
```

### 安卓

- 添加启动项

```xml
    <package android:name="com.unionpay" />
    <package android:name="com.unionpay.tsmservice" />
    <package android:name="com.unionpay.tsmservice.mi" />
    <package android:name="com.huawei.wallet" />
    <package android:name="com.cmbc.cc.mbank" />
```

### IOS

- 在工程 info.plist 设置中添加一个 URL Types 回调协议(在 UPPayDemo 工程中使用“UPPayDemo”作为协议)，用于在支付完成后返回商户客户端。

- 添加协议白名单: 在 Xcode7.0 之后的版本中进行开发，需要在工程对应的 plist 文件中，添加 LSApplicationQueriesSchemes Array 并加入 uppaysdk、uppaywallet、uppayx1、uppayx2、uppayx3 五个 item

- AppDelegate.m 的 下面 @end 前面添加下面代码

```c
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
  return [RCTLinkingManager application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}
```

## 使用

```js
import * as unionpay from '@shaogong/react-native-unionpay'

// 发起支付
await unionpay.startPay('tn')

// 检测是否安装
if(await unionpay.isAppInstalled()) {
  console.log('已经安装')
}
```