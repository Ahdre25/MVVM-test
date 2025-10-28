//
//  RadioListView.swift
//  MVVM test
//
//  Created by Fox on 27.10.2025.
//

import SwiftUI

struct RadioListView: View {
    let items: [String]
    
    @Binding var selectedItem: String
    
    @State private var searchText: String = ""
    
    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Поиск...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.top, 8)
                
                List(filteredItems, id: \.self) { item in
                    HStack {
                        Image(systemName: selectedItem == item ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(selectedItem == item ? .blue : .gray)
                            .onTapGesture {
                                selectedItem = item
                            }
                        Text(item)
                        Spacer()
                        
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedItem = item
                    }
                }
            }
            .navigationTitle("Выберите город")
        }
    }
}

//#Preview {
//    RadioListView()
//}
