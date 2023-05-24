//
//  SearchBar.swift
//  MeNota
//
//  Created by Larissa Fazolin on 24/05/23.
//

// For this to work, put the VStack inside of a NavigationView

import SwiftUI

struct SearchBar: View {
    @State var textFieldText = ""
    @State var dataArray: [String] = []

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search", text: $textFieldText)
                    .submitLabel(.search)
                    .onSubmit {
                        saveText()
                }
            }
            .foregroundColor(.gray)
            .padding(.vertical, 6)
            .padding(.horizontal, 6)
            .background(Color.gray.opacity(0.15).cornerRadius(10))
            
            ForEach(dataArray, id: \.self) { data in
                Text(data)
            }
            
            // Spacer()
        }
        .padding()
    }
    
    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
