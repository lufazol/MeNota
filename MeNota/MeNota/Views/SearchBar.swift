//
// SearchBar.swift
// MeNota
//
// Created by Larissa Fazolin on 24/05/23.
//

// For this to work, put the VStack inside of a NavigationView

// The keyboard should appear when you click on the text field in the simulator. If the keyboard doesn't appear, press Command + K

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var showFilteredResults: Bool
    @State var dataArray: [String] = []

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search", text: $text, onEditingChanged: { editingChanged in
                showFilteredResults = editingChanged
            })
                .submitLabel(.search)
                .foregroundColor(.white)
                
            // Delete button becomes available when the user starts typing
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 6)
        .background(Color.gray.opacity(0.15).cornerRadius(10))
        
        ForEach(dataArray, id: \.self) { data in
            Text(data)
        }
    }
}
