//
//  ListView.swift
//  Todo_MVVM
//
//  Created by iMac on 16/01/26.
//

import SwiftUI
import Combine

struct TodoListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                //Text("No Items 😔")
                NoItems()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else{
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItme(item: item)
                                }
                            }
                    }
                   
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
       
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List📝")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add", destination: AddView())
            .environmentObject(listViewModel)
        )
    }
    
     
}

struct ListView_Previews: PreviewProvider{
    static var previews: some View {
        NavigationView{
            TodoListView()
        }
        .environmentObject(ListViewModel())
    }
}


//import SwiftUI
//
//struct ListView: View {
//    @StateObject private var listViewModel = ListViewModel()
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                if listViewModel.items.isEmpty {
//                    Text("No items yet")
//                        .foregroundColor(.gray)
//                } else {
//                    List {
//                        ForEach(listViewModel.items) { item in
//                            ListRowView(item: item)
//                                .onTapGesture {
//                                    withAnimation(.linear) {
//                                        listViewModel.updateItem(item: item)
//                                    }
//                                }
//                        }
//                        .onDelete(perform: listViewModel.deleteItem)
//                        .onMove(perform: listViewModel.moveItem)
//                    }
//                    .listStyle(.plain)
//                }
//            }
//            .navigationTitle("Todo List 📝")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    EditButton()
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink {
//                        AddView(listViewModel: listViewModel)
//                    } label: {
//                        Image(systemName: "plus")
//                    }
//                }
//            }
//        }
//        .navigationViewStyle(.stack)
//    }
//}
