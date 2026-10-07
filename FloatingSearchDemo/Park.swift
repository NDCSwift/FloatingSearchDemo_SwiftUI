//
//  Project: FloatingSearchDemo
//  File: Park.swift
//  Created by Noah Carpenter
//
//  📺 YouTube: Noah Does Coding
//  https://www.youtube.com/@NoahDoesCoding
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Dream Big. Code Bigger 🚀
//

import Foundation

/// One national park. A plain value type: all the search UI needs is a name and a state to match against.
struct Park: Identifiable {
    // `Identifiable` lets `List(results)` tell rows apart without an `id:` argument.
    // A fresh UUID per park is fine for static sample data.
    let id = UUID()
    let name: String
    let state: String
}

// Sample data lives in an extension so the model itself stays small.
// Swap in your own parks, or any data with a couple of searchable strings.
// Three of these are in Utah: search "utah" to watch the list narrow to them.
extension Park {
    static let all: [Park] = [
        Park(name: "Acadia", state: "Maine"),
        Park(name: "Arches", state: "Utah"),
        Park(name: "Big Bend", state: "Texas"),
        Park(name: "Bryce Canyon", state: "Utah"),
        Park(name: "Glacier", state: "Montana"),
        Park(name: "Grand Canyon", state: "Arizona"),
        Park(name: "Olympic", state: "Washington"),
        Park(name: "Sequoia", state: "California"),
        Park(name: "Yellowstone", state: "Wyoming"),
        Park(name: "Yosemite", state: "California"),
        Park(name: "Zion", state: "Utah"),
    ]
}
