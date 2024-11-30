package com.rnwidget

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import android.content.SharedPreferences

open class TextWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
        super.onUpdate(context, appWidgetManager, appWidgetIds)

        val sharedPreferences = context.getSharedPreferences("WidgetPrefs", Context.MODE_PRIVATE)
        val currentText = sharedPreferences.getString("currentText", "Default Text") ?: "Default Text"

        for (appWidgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.text_widget_layout)
            views.setTextViewText(R.id.timeText, currentText)
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
