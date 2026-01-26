//
//  addView.swift
//  Todo_MVVM
//
//  Created by iMac on 16/01/26.
//

import SwiftUI
//import Combine

struct AddView: View {
    //@Environment(\.presentationMode) var presentationMode
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textfieldtext: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("type here...", text: $textfieldtext)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonClicked,
                       label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $showAlert, content: getalert)
    }
    
    func saveButtonClicked(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textfieldtext)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    
    func textIsAppropriate() -> Bool{
        if textfieldtext.count < 3 {
            alertTitle = "Your new Item must 3 char Long 😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getalert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}




struct AddView_preView: PreviewProvider{
    static var previews: some View{
        Group{
            NavigationView{
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            
            NavigationView{
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
        }
        
    }
}



//import SwiftUI
//
//struct AddView: View {
//    @ObservedObject var listViewModel: ListViewModel
//    @Environment(\.dismiss) private var dismiss
//    @State private var textfieldtext: String = ""
//    @State private var showAlert: Bool = false
//    
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 20) {
//                TextField("type here...", text: $textfieldtext)
//                    .padding(.horizontal)
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 55)
//                    .background(Color(.systemGray5))
//                    .cornerRadius(10)
//                
//                Button(action: saveButtonClicked) {
//                    Text("Save".uppercased())
//                        .foregroundColor(.white)
//                        .font(.headline)
//                        .frame(height: 55)
//                        .frame(maxWidth: .infinity)
//                        .background(textfieldtext.isEmpty ? Color.gray : Color.accentColor)
//                        .cornerRadius(10)
//                }
//                .disabled(textfieldtext.isEmpty)
//                
//                // Debug info
//                Text("Items in list: \(listViewModel.items.count)")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//            }
//            .padding(14)
//        }
//        .navigationTitle("Add an Item 🖋️")
//        .navigationBarTitleDisplayMode(.inline)
//        .alert("Please enter a title", isPresented: $showAlert) {
//            Button("OK", role: .cancel) { }
//        }
//    }
//    
//    func saveButtonClicked() {
//        let trimmedText = textfieldtext.trimmingCharacters(in: .whitespaces)
//        
//        print("🟢 Save button clicked")
//        print("🟢 Text field value: '\(trimmedText)'")
//        print("🟢 Items before save: \(listViewModel.items.count)")
//        
//        guard !trimmedText.isEmpty else {
//            showAlert = true
//            return
//        }
//        
//        listViewModel.addItem(title: trimmedText)
//        
//        // Small delay to ensure state updates before dismissing
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            print("🟢 Dismissing view. Items after save: \(self.listViewModel.items.count)")
//            dismiss()
//        }
//    }
//}
//
//// Preview Provider
//struct AddView_Preview: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            AddView(listViewModel: ListViewModel())
//        }
//    }
//}
// 
