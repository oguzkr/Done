//
//  DoneWidget.swift
//  DoneWidget
//
//  Created by Oguz Personal on 5.11.2022.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    let sharedUserDefaults = UserDefaults(suiteName: SharedUserDefaults.suiteName)
    @Environment(\.widgetFamily) var widgetFamily

    func placeholder(in context: Context) -> SimpleEntry {
        return SimpleEntry(date: Date(), tasks: self.fetchTasks(), doneTaskCount: self.doneTaskCount())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), tasks: self.fetchTasks(), doneTaskCount: self.doneTaskCount())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, tasks: self.fetchTasks(), doneTaskCount: self.doneTaskCount())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    func fetchTasks() -> [SharedUserDefaults.Task] {
        var defaultTasks = [SharedUserDefaults.Task]()
        if let tasks = sharedUserDefaults?.object(forKey: SharedUserDefaults.Keys.tasks) as? Data {
            let decoder = JSONDecoder()
            if let taskArray = try? decoder.decode([SharedUserDefaults.Task].self, from: tasks) {
                for task in taskArray {
                    defaultTasks.append(task)
                }
            }
        }

        return defaultTasks
    }
    
    func doneTaskCount() -> String {
        var count = 0
        let tasks = fetchTasks()
        for task in tasks {
            if task.completed {
                count += 1
            }
        }
        return String(count)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let tasks: [SharedUserDefaults.Task]
    let doneTaskCount: String
}

struct DoneWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        VStack {
            if entry.tasks.count > 0 {
                if widgetFamily == .systemExtraLarge || widgetFamily == .systemLarge {
                    HStack {
                        Image("check")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("You have done \(entry.doneTaskCount) of \(entry.tasks.count) tasks.")
                            .frame(height: 30)
                            .tint(Color(uiColor: UIColor(named: "textColor") ?? .clear))
                    }
                    .frame(height: 30)
                    .padding(7)
                }
                ForEach(entry.tasks) { task in
                    DoneWidgetTaskCell(task: task)
                        .frame(height: 40)
                        .padding([.leading, .trailing], 10)
                        .background(LinearGradient(gradient: Gradient(colors: task.color?.toGradientColor ?? [Color(uiColor: UIColor(named: "defaultTaskColor") ?? .clear)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 10)
                }
                Spacer()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            } else {
                if widgetFamily == .systemSmall {
                    VStack {
                        Image(systemName: "plus.circle")
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: .center)
                        Text("addYourFirstTask")
                            .foregroundColor(Color("textColor"))
                            .font(.title2)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding()
                } else {
                    HStack {
                        Image(systemName: "plus.circle")
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: .center)
                        Text("addYourFirstTask")
                            .foregroundColor(Color("textColor"))
                            .font(.title2)
                    }

                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding()
                }
            }

        }
        .padding(.top, 14)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)

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
        DoneWidgetEntryView(entry: SimpleEntry(date: Date(), tasks: [SharedUserDefaults.Task(title: "AAA", completed: false, color: "asteroid"),SharedUserDefaults.Task(title: "BB", completed: false, color: "asteroid"),SharedUserDefaults.Task(title: "CC", completed: false, color: "asteroid"),SharedUserDefaults.Task(title: "AA", completed: false, color: "asteroid"),SharedUserDefaults.Task(title: "BB", completed: false, color: "asteroid"),SharedUserDefaults.Task(title: "CC", completed: false, color: "asteroid"), SharedUserDefaults.Task(title: "CC", completed: false, color: "asteroid"), SharedUserDefaults.Task(title: "CC", completed: false, color: "asteroid")], doneTaskCount: "4"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}



