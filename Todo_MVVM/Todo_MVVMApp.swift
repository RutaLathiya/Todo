//
//  Todo_MVVMApp.swift
//  Todo_MVVM
//
//  Created by iMac on 16/01/26.
//

import SwiftUI
/*
 Model -> data point
 View -> UI
 ViewModel -> manages Model for View
 
 
 */

@main
struct Todo_MVVMApp: App {
    
    @StateObject var listViewModel: ListViewModel =  ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TodoListView()
            }
            .navigationViewStyle(.stack)
            .environmentObject(listViewModel)
        }
    }
}


//@main
//struct TodoApp: App {
//    var body: some Scene {
//        WindowGroup {
//            TodoListView()
//        }
//    }
//}
