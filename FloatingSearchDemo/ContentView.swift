//
//  Project: FloatingSearchDemo
//  File: ContentView.swift
//  Created by Noah Carpenter
//
//  📺 YouTube: Noah Does Coding
//  https://www.youtube.com/@NoahDoesCoding
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Dream Big. Code Bigger 🚀
//

import SwiftUI

// The one rule from the video: search floats at the BOTTOM EDGE of the screen on iPhone (iOS 26+),
// and whoever owns that bottom edge decides how it shows up.
//
//   1. Nobody owns it       → `.searchable` on a NavigationStack floats a glass field at the bottom.
//   2. Your toolbar owns it → give search a slot: `DefaultToolbarItem(kind: .search, placement: .bottomBar)`,
//                             and optionally fold it to a button with `.searchToolbarBehavior(.minimize)`.
//   3. A tab bar owns it    → search becomes its own tab with `Tab(role: .search)`.  ← this file
//
// This is the finished state: owner #3. See "Other owners" at the bottom for #1 and #2.

struct ContentView: View {
    // The search text lives here, at the TabView level, because `.searchable` is attached to the TabView.
    // The search tab's list reads it; the Parks tab ignores it.
    @State private var query = ""

    var body: some View {
        TabView {
            // A normal tab. It gets an empty query, so it always shows every park.
            // Each tab has its own NavigationStack, so each one gets its own title and toolbar.
            Tab("Parks", systemImage: "tree") {
                NavigationStack {
                    ParkListView(query: "")
                }
            }

            // A tab with no search at all. Once a tab bar owns the bottom edge, a per-screen
            // `.searchable` has nowhere good to go. That's why search moves into its own tab below.
            Tab("Saved", systemImage: "bookmark") {
                ContentUnavailableView("No Saved Parks", systemImage: "bookmark")
            }

            // `role: .search` is what makes this THE search tab: the system pins it as a round
            // button at the trailing end of the tab bar. No title or icon needed; the role provides them.
            // (`.searchable` inside a plain Tab with no search role shows no field at rest.)
            Tab(role: .search) {
                NavigationStack {
                    ParkListView(query: query)
                }
            }
        }
        // `.searchable` goes on the TabView, not on a tab's content, so the search tab can host the field.
        // `prompt` is the placeholder text inside the field.
        .searchable(text: $query, prompt: "Parks or states")
        // Decides what selecting the search tab does. `.searchTabSelection` opens the field right away:
        // the tab bar folds into a floating search field with a cursor in it, so one tap gets you typing.
        .tabViewSearchActivation(.searchTabSelection)
    }
}

// MARK: - Other owners (from the video)
//
// Owner #1: nobody owns the bottom edge. No TabView, no bottom toolbar:
//
//     NavigationStack {
//         ParkListView(query: query)
//     }
//     .searchable(text: $query, prompt: "Parks or states")
//
// Owner #2: your toolbar owns it. Put a `.bottomBar` item there and search disappears completely,
// until you give it a slot of its own:
//
//     .toolbar {
//         ToolbarItem(placement: .bottomBar) {
//             Button("Sort", systemImage: "arrow.up.arrow.down") { ascending.toggle() }
//         }
//         ToolbarSpacer(placement: .bottomBar)                       // pushes search to the trailing side
//         DefaultToolbarItem(kind: .search, placement: .bottomBar)   // "search goes HERE in my toolbar"
//     }
//     .searchToolbarBehavior(.minimize)                              // optional: field → round button

#Preview {
    ContentView()
}
