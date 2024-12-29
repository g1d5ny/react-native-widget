package com.rnwidget
import android.content.Context
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
    val sharedPreferences: SharedPreferences = context.getSharedPreferences("WidgetPrefs", Context.MODE_PRIVATE)
    val editor = sharedPreferences.edit()
    editor.putString(key, value)
    editor.apply()
  }
  
  @ReactMethod
  fun setTextToWidget(text: String, promise: Promise) {
    try {
        val context = reactApplicationContext
        saveToSharedPreferences(context, "currentText", text)
        promise.resolve("Text saved to SharedPreferences successfully")
    } catch (e: Exception) {
        promise.reject("TEXT_SAVE_ERROR", e)
    }
}


  companion object {
    const val NAME = "RNWidget"
  }
}
