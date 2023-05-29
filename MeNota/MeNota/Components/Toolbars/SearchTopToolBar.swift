//
//  SearchTopToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 25/05/23.
//

import SwiftUI

struct SearchTopToolBar: View {
    @Environment(\.presentationMode) var presentationMode // Access the presentation mode
    
    @State var textFieldText = ""
    @State var dataArray: [String] = []

    var body: some View {
        HStack {
            SearchBar()
                .padding(.leading)
                .padding(.trailing, -10)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss() // Dismiss the current view
            }) {
                Text("Cancel")
                    .padding()
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct SearchTopToolBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchTopToolBar()
    }
}
