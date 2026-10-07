//
//  Project: FloatingSearchDemo
//  File: ParkListView.swift
//  Created by Noah Carpenter
//
//  📺 YouTube: Noah Does Coding
//  https://www.youtube.com/@NoahDoesCoding
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Dream Big. Code Bigger 🚀
//

import SwiftUI

/// A list of parks, filtered by `query` and sortable A→Z / Z→A.
///
/// This view doesn't own the search text. It receives it as a plain `String` from whoever
/// attached `.searchable` (here, ContentView's TabView). That keeps it reusable:
/// the Parks tab passes `""` to show everything, and the search tab passes the live query.
struct ParkListView: View {
    let query: String

    // Sort order is local UI state, so it belongs to this view.
    @State private var ascending = true

    /// The parks to show: filtered by the query, then sorted.
    /// A computed property re-runs whenever `query` or `ascending` changes, so the list stays in sync for free.
    private var results: [Park] {
        Park.all
            .filter { park in
                // An empty query means "no filter".
                // `localizedStandardContains` is the search-friendly comparison: it ignores case and
                // diacritics and respects the user's locale, so typing "utah" still matches "Utah".
                query.isEmpty
                || park.name.localizedStandardContains(query)
                || park.state.localizedStandardContains(query)
            }
            .sorted { ascending ? $0.name < $1.name : $0.name > $1.name }
    }

    var body: some View {
        List(results) { park in
            VStack(alignment: .leading) {
                Text(park.name)
                    .font(.headline)
                Text(park.state)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        // When a search matches nothing, show the system's search empty state.
        // `ContentUnavailableView.search(text:)` quotes the query back to the user.
        .overlay {
            if results.isEmpty {
                ContentUnavailableView.search(text: query)
            }
        }
        .navigationTitle("Parks")
        .toolbar {
            // Sort lives in the TOP bar on purpose. Inside a TabView the tab bar owns the bottom edge,
            // and a `.bottomBar` button ends up wedged against the tab bar. Leave the bottom to its owner.
            ToolbarItem(placement: .topBarTrailing) {
                Button("Sort", systemImage: "arrow.up.arrow.down") {
                    ascending.toggle()
                }
            }
        }
    }
}
