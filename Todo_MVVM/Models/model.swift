//
//  model.swift
//  Todo_MVVM
//
//  Created by iMac on 16/01/26.
//

//import Foundation
import SwiftUI

// immuteble struct
struct ItemModel: Identifiable, Codable{
    let id: String
    let title: String
    let isCompleted: Bool
    
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updataeCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}



//import Foundation
//
//struct ItemModel: Identifiable {
//    let id: String
//    let title: String
//    let isCompleted: Bool
//    
//    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
//        self.id = id
//        self.title = title
//        self.isCompleted = isCompleted
//    }
//    
//    func updateCompletion() -> ItemModel {
//        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
//    }
//}
