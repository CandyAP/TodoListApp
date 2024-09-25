//
//  ListRowView.swift
//  TodoListApp
//
//  Created by Candy Pangestu on 9/25/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
    }
}


#Preview {
    ListRowView(item: ItemModel(title: "First", isCompleted: false))
}

#Preview {
    ListRowView(item: ItemModel(title: "Second", isCompleted: true))
}
