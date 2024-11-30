package com.rnwidget

import android.content.SharedPreferences
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

class TextWidgetModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "TextWidgetModule"
    }

    @ReactMethod
    fun updateText(currentText: String) {
        val sharedPreferences = reactApplicationContext.getSharedPreferences("WidgetPrefs", ReactApplicationContext.MODE_PRIVATE)
        val editor = sharedPreferences.edit()
        editor.putString("currentText", currentText)
        editor.apply()
    }
}
