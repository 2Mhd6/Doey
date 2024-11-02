//
//  DoeyApp.swift
//  Todo List
//
//  Created by Mohammed on 29/10/2024.
//

import SwiftUI
import SwiftData

@main
struct DoeyApp: App {
    
    @AppStorage("isNewUser") var isNewUser: Bool = true

    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .fullScreenCover(isPresented: $isNewUser) {
                    isNewUser = false
                } content: {
                    onboardingView()
                }
                .modelContainer(for: Todo.self, isAutosaveEnabled: false)

        }
    }
}
