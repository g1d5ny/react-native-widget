//
//  WidgetExampleLiveActivity.swift
//  WidgetExample
//
//  Created by 지언 on 11/25/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetExampleAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetExampleLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetExampleAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetExampleAttributes {
    fileprivate static var preview: WidgetExampleAttributes {
        WidgetExampleAttributes(name: "World")
    }
}

extension WidgetExampleAttributes.ContentState {
    fileprivate static var smiley: WidgetExampleAttributes.ContentState {
        WidgetExampleAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WidgetExampleAttributes.ContentState {
         WidgetExampleAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WidgetExampleAttributes.preview) {
   WidgetExampleLiveActivity()
} contentStates: {
    WidgetExampleAttributes.ContentState.smiley
    WidgetExampleAttributes.ContentState.starEyes
}
