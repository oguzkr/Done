//
//  DoneWidget.swift
//  DoneWidget
//
//  Created by Oguz Personal on 5.11.2022.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct DoneWidgetEntryView : View {
    var entry: Provider.Entry
    let sharedUserDefaults = UserDefaults(suiteName: SharedUserDefaults.suiteName)

    var body: some View {
        VStack {
            if let tasks = sharedUserDefaults?.object(forKey: SharedUserDefaults.Keys.tasks) as? Data {
                let decoder = JSONDecoder()
                if let taskArray = try? decoder.decode([SharedUserDefaults.Task].self, from: tasks) {
                    ForEach(taskArray) { task in
                        Text(task.title)
                    }
                }
            }
        }

    }
}

struct DoneWidget: Widget {
    let kind: String = "DoneWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DoneWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Done")
        .description("Track your tasks")
    }
}

struct DoneWidget_Previews: PreviewProvider {
    static var previews: some View {
        DoneWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
