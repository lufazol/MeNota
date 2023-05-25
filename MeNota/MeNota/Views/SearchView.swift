//
//  SearchView.swift
//  MeNota
//
//  Created by Larissa Fazolin on 25/05/23.
//

import SwiftUI

struct SearchView: View {
    let items = [
        (systemName: "person.crop.circle", text: "Shared Notes"),
        (systemName: "lock.fill", text: "Locked Notes"),
        (systemName: "checklist", text: "Notes with Checklists"),
        (systemName: "number", text: "Notes with Tags"),
        (systemName: "pencil.tip.crop.circle", text: "Notes with Drawings"),
        (systemName: "doc.viewfinder", text: "Notes with Scanned Documents"),
        (systemName: "paperclip", text: "Notes with Attachments")
    ]
    
    var body: some View {
        VStack {
            SearchTopToolBar()
            
            List {
                ForEach(items, id: \.text) { item in
                    HStack(alignment: .top) {
                        Image(systemName: item.systemName)
                        Text(item.text)
                    }
                }
                .alignmentGuide(.leading) { _ in 0 }
            }
            
            Spacer()
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
