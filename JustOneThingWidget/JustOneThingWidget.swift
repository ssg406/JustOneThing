//
//  JustOneThingWidget.swift
//  JustOneThingWidget
//
//  Created by Samuel Jones on 10/28/24.
//

import WidgetKit
import SwiftUI
import JustOneThingUI

// TODO: change user defaults to suite for sharing with widget

// TODO: Timeline has one entry if the person has requested a task and waiting on a notification, they can mark it done or end it from here.
// TODO: Timeline has another entry when no task is in progress, and they "get todo" to get one (open in app? not sure) or another button to add one (use intent or app, not sure).

struct JustOneEntry: TimelineEntry {
    public let date: Date
    let relevance: TimelineEntryRelevance?
    let item: TodoItem?
}

struct JustOneTimelineProvider: TimelineProvider {
    
    public typealias Entry = JustOneEntry
    
    func placeholder(in context: Context) -> JustOneEntry {
        JustOneEntry(date: Date(), relevance: nil, item: nil)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (JustOneEntry) -> Void) {
        // Return widget state in transient situation or in preview
        if context.isPreview {
            let entry = JustOneEntry(date: .now, relevance: nil, item: TodoItem.examples.first!)
            completion(entry)
        } else {
            completion(JustOneEntry(date: .now, relevance: nil, item: nil))
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<JustOneEntry>) -> Void) {
        let timeline = Timeline(
            entries: [
                Entry(date: .now, relevance: nil, item: nil)
            ],
            policy: .atEnd)
        completion(timeline)
    }
}

struct JustOneWidgetPlaceholderView: View {
    var body: some View {
        Text("Placeholder view")
    }
}

struct JustOneWidgetEntryView: View {
    var entry: JustOneTimelineProvider.Entry
    
    var body: some View {
        VStack {
            if let item = entry.item {
                Text(item.name)
            } else {
                
                VStack(spacing: 10) {
                    Text("One")
                        .font(.custom(C.Fonts.permanentMarker, size: 20))
                        .foregroundStyle(.white)
                    Button(intent: CreateTodoItemIntent()) {
                        Label("Add One", systemImage: C.Img.squarePlus)
                    }
                    .foregroundStyle(GradientStyle(.blueGreen))
                    
                    Button(intent: GetTodoItemIntent()) {
                        Label("Get One", systemImage: C.Img.runner)
                    }
                    .foregroundStyle(GradientStyle(.orangeRed))
                }
                .buttonStyle(.plain)
                
            }
        }
        .containerBackground(for: .widget) {
            LinearGradient(colors: [
                Color(red: 54/255, green: 54/255, blue: 54/255),
                .black
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}

struct JustOneWidget: Widget {
    private static var supportedFamilies: [WidgetFamily] {
#if os(iOS)
        if #available(iOS 15, *) {
            return [.systemLarge, .systemExtraLarge]
        } else {
            return [.systemLarge]
        }
#else
        return []
#endif
    }
    
    public var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: C.Ext.widgetKind,
            provider: JustOneTimelineProvider()) { entry in
                JustOneWidgetEntryView(entry: entry)
            }
            .configurationDisplayName("Just One Widget")
            .description("Start/stop todo items or add new ones")
    }
}


#Preview(as: .systemSmall) {
    JustOneWidget()
} timeline: {
    JustOneEntry(date: .now, relevance: nil, item: nil)
}
