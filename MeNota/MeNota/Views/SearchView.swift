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
                Section(header: SectionHeaderView(text: "Suggested", capitalization: .none)) {
                    ForEach(items, id: \.text) { item in
                        HStack(alignment: .top, spacing: 20) {
                            Image(systemName: item.systemName)
                                .foregroundColor(.accentColor)
                            Text(item.text)
                        }
                    }
                    .alignmentGuide(.leading) { _ in 0 }
                }
            }
            .listStyle(.plain)
            .padding(.vertical, -20)
            .padding(.horizontal, -5)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
