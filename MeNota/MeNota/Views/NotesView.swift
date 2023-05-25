//
//  NotesView.swift
//  MeNota
//
//  Created by Larissa Fazolin on 24/05/23.
//

import SwiftUI

struct writtenNotes: Identifiable, Hashable {
    let title: String
    let subtitle: String
    let id = NSUUID().uuidString
}

struct NotesView: View {
    let notesPreview: [writtenNotes] = [
        .init(title: "Title 1", subtitle: "Subtitle 1"),
        .init(title: "Title 2", subtitle: "Subtitle 2"),
        .init(title: "Title 3", subtitle: "Subtitle 3"),
        .init(title: "Title 4", subtitle: "Subtitle 4")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar()
                
                List {
                    Section(header: SectionHeaderView(text: "Yesterday", capitalization: .none)) {
                        ForEach(notesPreview) { preview in
                            VStack(alignment: .leading) {
                                Text(preview.title)
                                    .font(.headline)
                                Text(preview.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .padding()
            Spacer()
            .navigationBarTitle("Notes")
        }
    }
}

struct SectionHeaderView: View {
    let text: String
    let capitalization: Text.Case?
    
    var body: some View {
        Text(text)
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.black)
            .textCase(capitalization) // Set the capitalization style
            .padding(.top, 10)
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
