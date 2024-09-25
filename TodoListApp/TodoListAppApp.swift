//
//  TodoListAppApp.swift
//  TodoListApp
//
//  Created by Candy Pangestu on 9/25/24.
//

import SwiftUI

@main
struct TodoListAppApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()                
            }
        }
        .environmentObject(listViewModel)
    }
}
