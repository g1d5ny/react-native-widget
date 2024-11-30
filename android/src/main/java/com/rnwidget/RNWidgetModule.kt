package com.rnwidget

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.os.Build
import android.widget.RemoteViews
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import android.content.SharedPreferences

class RNWidgetModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  fun multiply(a: Double, b: Double, promise: Promise) {
    promise.resolve(a * b)
  }

  private fun saveToSharedPreferences(context: Context, key: String, value: String) {
    val sharedPreferences: SharedPreferences = context.getSharedPreferences("com.androidwidgetexample", Context.MODE_PRIVATE)
    val editor = sharedPreferences.edit()
    editor.putString(key, value)
    editor.apply()
  }

  private fun getFromSharedPreferences(context: Context, key: String): String? {
    val sharedPreferences: SharedPreferences = context.getSharedPreferences("com.widgetexample", Context.MODE_PRIVATE)
    return sharedPreferences.getString(key, null)
  }

  @ReactMethod
  fun setTextToWidget(time: String, promise: Promise) {
    try {
        val context = reactApplicationContext

        val sharedPreferences = context.getSharedPreferences("WidgetPrefs", Context.MODE_PRIVATE)
        val editor = sharedPreferences.edit()
        editor.putString("currentText", time) 
        editor.apply()

        promise.resolve("Text saved to SharedPreferences successfully")
    } catch (e: Exception) {
        promise.reject("TEXT_SAVE_ERROR", e)
    }
}


  companion object {
    const val NAME = "RNWidget"
  }
}
