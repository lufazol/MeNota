//
//  SearchView.swift
//  MeNota
//
//  Created by Larissa Fazolin on 25/05/23.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            SearchTopToolBar()
            
            HStack(alignment: .top) {
                Image(systemName: "person.crop.circle")
                Text("Shared Notes")
            }
            .alignmentGuide(.leading) { _ in 0 }
            
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
