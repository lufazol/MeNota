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
        NavigationView {
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
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal, -16)
            }
            .padding()
            // .background(Color(UIColor.systemGray6))
            .navigationBarTitle("Notes")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SectionHeaderView: View {
    let text: String
    let capitalization: Text.Case?
    
    var body: some View {
        Text(text)
            .font(.title3.bold())
            .foregroundColor(.white)
            .textCase(capitalization)
            .alignmentGuide(.leading) { _ in 0 }
            .padding(.vertical, 5)
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
