import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let text: String
}

struct Provider: AppIntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), text: "No Data")
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration, text: "No Data")
    }

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        let userDefaults = UserDefaults(suiteName: "group.com.example.rnwidget")
        let currentText = userDefaults?.string(forKey: "currentText")
        let text = currentText ?? "No Data!! \(String(describing: currentText))"
        let entry = SimpleEntry(date: Date(), configuration: configuration, text: text)
        entries.append(entry)

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct WidgetExampleEntryView: View {
    var entry: SimpleEntry

    var body: some View {
        VStack {
            Text("Widget Text:")
            Text(entry.text) 
                .font(.headline)
        }
    }
}

struct WidgetExample: Widget {
    let kind: String = "WidgetExample"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WidgetExampleEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Simple Text Widget")
        .description("This widget displays a simple text from UserDefaults.")
    }
}