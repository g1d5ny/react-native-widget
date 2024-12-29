//
//  AppIntent.swift
//  WidgetExample
//
//  Created by 지언 on 11/25/24.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "TextWidget", default: "Text")
    var text: String
}
