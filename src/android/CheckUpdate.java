package com.enterra.checkupdate;

import org.apache.cordova.CallbackContext;

import android.content.pm.PackageManager;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;

public class CheckUpdate extends CordovaPlugin {

    String newVersion;

    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {

        if (action.equals("check")) {
            try {
                PackageManager pm = this.cordova.getActivity().getPackageManager();
                String packageName = this.cordova.getActivity().getPackageName();
                String curVersion =  pm.getPackageInfo(packageName, 0).versionName;
                callbackContext.success(curVersion);
            } catch (PackageManager.NameNotFoundException e) {
                callbackContext.error(e.getMessage());
            }
            return true;
        } else {
            return false;
        }
    }
}
