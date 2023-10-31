//
//  BookTokApp.swift
//  BookTok
//
//  Created by Javier Gutierrez on 30/10/23.
//

import SwiftUI
import SwiftData
@main
struct BookTokApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Book.self)
        }
    }
}
