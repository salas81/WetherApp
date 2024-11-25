//
//  WetherAppApp.swift
//  WetherApp
//
//  Created by Lorenzo Decaria on 11/23/24.
//

import SwiftUI
import SwiftData

@main
struct WetherAppApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherDetailView()
        }
//        .modelContainer(sharedModelContainer)
    }
}
