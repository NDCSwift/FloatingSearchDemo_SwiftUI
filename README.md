# 🔍 FloatingSearchDemo_SwiftUI

A tiny SwiftUI project showing where the iOS 26 floating search bar goes, and why it moves: on its own, sharing your toolbar, or as its own tab.

---

## 🤔 What this is

On iPhone, search now floats in glass at the bottom of the screen. Where it floats isn't one modifier. It depends on **who owns the bottom edge**:

| Who owns the bottom edge | What search does | The API |
|---|---|---|
| Nobody | Floats as a full-width glass field | `.searchable` on a `NavigationStack` |
| Your toolbar | Disappears until you give it a slot, then shares the bar (optionally as a round button) | `DefaultToolbarItem(kind: .search, placement: .bottomBar)`, `.searchToolbarBehavior(.minimize)` |
| A tab bar | Becomes its own tab; tapping it turns the tab bar into the field | `Tab(role: .search)`, `.tabViewSearchActivation(.searchTabSelection)` |

The project is the finished app: a parks list with search as its own tab. The first two owners are written out in comments at the bottom of `ContentView.swift`, so you can paste them in and watch search move.

## ✅ Why you'd use it

- **One rule instead of trial and error.** If your search bar vanished after you added a toolbar button, this shows why, and the one line that brings it back.
- **The modern search APIs together.** `DefaultToolbarItem`, `ToolbarSpacer`, `searchToolbarBehavior`, `Tab(role: .search)` and `tabViewSearchActivation` in one small project.
- **Heavily commented.** Every modifier explains what it does and why it's placed where it is.

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/V3LFj7U-cJA)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding).

---

## 🚀 Getting Started

### 1. Clone

```bash
git clone https://github.com/NDCSwift/FloatingSearchDemo_SwiftUI.git
cd FloatingSearchDemo_SwiftUI
```

### 2. Open

```bash
open FloatingSearchDemo.xcodeproj
```

### 3. Run on an iPhone simulator

Pick an **iPhone** simulator as the run destination, not "My Mac". The bottom-bar behaviour is an iPhone layout.

### 4. Team (device only)

Select the project in the navigator → **Signing & Capabilities** → set your own **Team**. Not required for the Simulator.

### 5. Bundle ID (device only)

The default bundle identifier is `com.example.FloatingSearchDemo`. Change it to something unique (e.g. `com.yourname.FloatingSearchDemo`) if you plan to run on a device.

## 🛠️ Notes

- `Park.all` in `Park.swift` is the sample data from the video. Type it out, paste it, or swap in your own.
- Try searching `utah` (three parks) and `xyz` (the system's no-results view).
- **Search bar disappeared?** Something else has claimed the bottom edge, usually a `ToolbarItem(placement: .bottomBar)`. Add `DefaultToolbarItem(kind: .search, placement: .bottomBar)` to give search a slot.
- **"only available in iOS 26.0 or newer"?** Your deployment target is below iOS 26. These APIs need iOS 26.

## 📦 Requirements

- Xcode 26 or later
- iOS 26.0+ deployment target
- Swift 6 / SwiftUI
