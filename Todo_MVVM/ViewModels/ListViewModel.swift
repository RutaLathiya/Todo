//
//  listViewModel.swift
//  Todo_MVVM
//
//  Created by iMac on 20/01/26.
//

import Foundation
import Combine
import SwiftUI

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemskey: String = "items_List"
    init(){
        getItems()
    }
    
    func getItems()  {
//        let newitems = [
//            ItemModel(title: "this is first title", isCompleted: false),
//            ItemModel(title: "this is Second title", isCompleted: true),
//            ItemModel(title: "this is third title", isCompleted: false)
//        ]
//        items.append(contentsOf: newitems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemskey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
         
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
    func addItem(title: String){
        let newitem = ItemModel(title: title, isCompleted: false)
        items.append(newitem)
        print("Item added: \(title), Total items: \(items.count)") 
    }
    
    func updateItme(item: ItemModel){
        
//        if let index = items.firstIndex { (exsitingItem) -> Bool in
//            return exsitingItem.id == item.id
//        }{
//            // run this code
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updataeCompletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemskey)
        }
    }
    
}



//import Foundation
//import Combine
//import SwiftUI
//
//class ListViewModel: ObservableObject {
//    @Published var items: [ItemModel] = [] {
//        didSet {
//            print("📊 Items updated. Count: \(items.count)")
//        }
//    }
//    
//    init() {
//        getItems()
//    }
//    
//    func getItems() {
//        let newitems = [
//            ItemModel(title: "this is first title", isCompleted: false),
//            ItemModel(title: "this is Second title", isCompleted: true),
//            ItemModel(title: "this is third title", isCompleted: false)
//        ]
//        items.append(contentsOf: newitems)
//    }
//    
//    func deleteItem(indexSet: IndexSet) {
//        items.remove(atOffsets: indexSet)
//    }
//    
//    func moveItem(from: IndexSet, to: Int) {
//        items.move(fromOffsets: from, toOffset: to)
//    }
//    
//    func addItem(title: String) {
//        print("🔵 addItem called with: '\(title)'")
//        print("🔵 Current items count: \(items.count)")
//        
//        let newitem = ItemModel(title: title, isCompleted: false)
//        
//        // Force main thread update
//        DispatchQueue.main.async {
//            self.items.append(newitem)
//            print("✅ Item added! New count: \(self.items.count)")
//        }
//    }
//    
//    func updateItem(item: ItemModel) {
//        if let index = items.firstIndex(where: { $0.id == item.id }) {
//            items[index] = item.updateCompletion()
//        }
//    }
//}
