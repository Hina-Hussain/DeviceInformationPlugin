package co.creativemind.device_information;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.media.MediaDrm;
import android.os.Build;
import android.telephony.TelephonyManager;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.core.content.ContextCompat;

import java.util.Arrays;
import java.util.UUID;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** DeviceInformationPlugin */
public class DeviceInformationPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Activity activity;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "device_information");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android "+android.os.Build.VERSION.RELEASE);
    }
    else if(call.method.equals("getIMEINumber")){
      String imeiNo = getIMEINo();
      if(imeiNo!=null && imeiNo.equals(Manifest.permission.READ_PHONE_STATE)){
        result.error(Manifest.permission.READ_PHONE_STATE,"Permission is not granted!",null);
      }
      else if(imeiNo!=null && imeiNo.length()>0){
        result.success(imeiNo);
      }
    }
    else if(call.method.equals("getAPILevel")){
      result.success(Build.VERSION.SDK_INT);
    }
    else if(call.method.equals("getModel")){
      result.success(Build.MODEL);
    }
    else if(call.method.equals("getManufacturer")){
      result.success(Build.MANUFACTURER);
    }
    // Added in new release 0.0.2
    else if(call.method.equals("getDevice")){
      result.success(Build.DEVICE);
    }
    else if(call.method.equals("getProduct")){
      result.success(Build.PRODUCT);
    }
    else if(call.method.equals("getCPUType")){
      result.success(Build.CPU_ABI);
    }
    else if(call.method.equals("getHardware")){
      result.success(Build.HARDWARE);
    }

    else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @SuppressLint({"HardwareIds", "MissingPermission"})
  public String getIMEINo() {
    String imeiNumber = "";
    TelephonyManager telephonyManager = (TelephonyManager) activity.getSystemService(Context.TELEPHONY_SERVICE);
    if (ContextCompat.checkSelfPermission(activity, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {
      return Manifest.permission.READ_PHONE_STATE;
    }else{
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
        imeiNumber = getDeviceUniqueID();

      }else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
        if (telephonyManager != null && telephonyManager.getImei() != null) {
          imeiNumber = telephonyManager.getImei();
        }
      }else {
        if (telephonyManager != null && telephonyManager.getDeviceId() != null) {
          imeiNumber = telephonyManager.getDeviceId();
        }
      }
    }
    return imeiNumber;
  }

  @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN_MR2)
  @Nullable
  public String getDeviceUniqueID() {
    UUID wideVineUuid = new UUID(-0x121074568629b532L, -0x5c37d8232ae2de13L);
    try {
      MediaDrm wvDrm = new MediaDrm(wideVineUuid);
      byte[] wideVineId = wvDrm.getPropertyByteArray(MediaDrm.PROPERTY_DEVICE_UNIQUE_ID);
      String stringWithSymbols = Arrays.toString(wideVineId);
      String strWithoutBrackets = stringWithSymbols.replaceAll("\\[","");
      String strWithoutBrackets1 = strWithoutBrackets.replaceAll("]","");
      String strWithoutComma = strWithoutBrackets1.replaceAll(",","");
      String strWithoutHyphen = strWithoutComma.replaceAll("-","");
      String strWithoutSpace = strWithoutHyphen.replaceAll(" ","");
      return strWithoutSpace.substring(0,15);
    } catch (Exception e) {
      return "";
    }
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

  }

  @Override
  public void onDetachedFromActivity() {
   this.activity = null;
  }
}
