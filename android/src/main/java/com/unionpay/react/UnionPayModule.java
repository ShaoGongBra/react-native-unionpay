package com.unionpay.react;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import com.facebook.react.bridge.WritableMap;
import com.unionpay.UPPayAssistEx;

import org.json.JSONException;
import org.json.JSONObject;

public class UnionPayModule extends ReactContextBaseJavaModule implements ActivityEventListener {

  private Context reactContent;

  Promise payPromise;


  public UnionPayModule(ReactApplicationContext context) {
    super(context);
    reactContent = context;
    context.addActivityEventListener(this);
  }

  @Override
  public String getName() {
    return "UnionPay";
  }

  @ReactMethod
  public void startPay(String tn, String serverMode, Promise promise) {
    UPPayAssistEx.startPay(getCurrentActivity(), null, null, tn, serverMode);
    payPromise = promise;
  }

  @ReactMethod
  public void isAppInstalled(String serverMode, String merId, Promise promise) {
    Boolean status = UPPayAssistEx.checkWalletInstalled(reactContent, serverMode, merId);
    payPromise.resolve(status);
  }

  @Override
  public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
    // 无数据
    if (data == null) return;
    // 非银联支付窗体返回码
    if (requestCode != 10) return;

    String str = data.getExtras().getString("pay_result");
    // 返回数据错误
    if (str == null || str.equals("") || str.length() == 0) return;

    WritableMap params = Arguments.createMap();
    params.putString("code", str.toLowerCase());
    if (str.equalsIgnoreCase("success")) {
      // TODO: 10/25/16
      // 支付成功后，extra中如果存在result_data，取出校验
      // result_data结构见c）result_data参数说明
      if (data.hasExtra("result_data")) {

        String result = data.getExtras().getString("result_data");
        try {
          JSONObject resultJson = new JSONObject(result);
          String sign = resultJson.getString("sign");
          String dataOrg = resultJson.getString("data");
          params.putString("sign", sign);
          params.putString("data", dataOrg);
        } catch (JSONException e) {
        }
      } else {
      }

    } else if (str.equalsIgnoreCase("fail")) {
      // TODO: 10/25/16
    } else if (str.equalsIgnoreCase("cancel")) {
      // TODO: 10/25/16
    }
    if (payPromise != null) {
      payPromise.resolve(params);
    }
  }

  @Override
  public void onNewIntent(Intent intent) {
  }
}
