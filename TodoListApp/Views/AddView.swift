//
//  AddView.swift
//  TodoListApp
//
//  Created by Candy Pangestu on 9/25/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type your item here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.secondary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button("Save") {
                    saveButtonPressed()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.indigo)
                .tint(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            }
            .padding(.horizontal)
            
          
            
        }
        .navigationTitle("Add Items")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "harus lebih dari 3"
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
