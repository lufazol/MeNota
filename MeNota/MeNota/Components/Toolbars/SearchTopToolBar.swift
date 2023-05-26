//
//  SearchTopToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 25/05/23.
//

import SwiftUI

struct SearchTopToolBar: View {
    @State var textFieldText = ""
    @State var dataArray: [String] = []

    var body: some View {
        HStack {
            SearchBar()
                .padding(.leading)
                .padding(.trailing, -10)
            
            Button(action: {
            }) {
                Text("Cancel")
            }
            .padding()
        }
    }
}

struct SearchTopToolBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchTopToolBar()
    }
}
