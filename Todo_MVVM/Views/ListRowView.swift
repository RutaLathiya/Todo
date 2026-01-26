//
//  ListRowView.swift
//  Todo_MVVM
//
//  Created by iMac on 16/01/26.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
       
            HStack{
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red)
                Text(item.title)
                Spacer()
            }
            .font(.title2)
            .padding(.vertical, 8)
        }
    }

struct ListRowView_PreView: PreviewProvider{
    
    static var item1 = ItemModel(title: "first", isCompleted: false)
    static var item2 = ItemModel(title: "Second", isCompleted: true)
    static var item3 = ItemModel(title: "thired", isCompleted: false)
    
    
    static var previews: some View{
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
            ListRowView(item: item3)
        }
        .previewLayout(.sizeThatFits)
    }
}



//import SwiftUI
//
//struct ListRowView: View {
//    let item: ItemModel
//    
//    var body: some View {
//        HStack {
//            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
//                .foregroundColor(item.isCompleted ? .green : .red)
//            Text(item.title)
//            Spacer()
//        }
//        .font(.title3)
//        .padding(.vertical, 8)
//    }
//}
