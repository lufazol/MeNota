//
//  NotesView.swift
//  MeNota
//
//  Created by Larissa Fazolin on 24/05/23.
//

import SwiftUI

struct NotesView: View {
    @StateObject var noteList = NoteList()
    
    var body: some View {
        VStack {
            SearchBarButton()
                .padding(.top, -15)

            List {
                createSection(header: "Today", notes: Array(noteList.note.prefix(2)))
                
                createSection(header: "Previous 7 Days", notes: Array(noteList.note.dropFirst(2)))
            }
            .padding(.horizontal, -20)
        }
        .padding()
        .navigationBarTitle("Notes")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NotesTopToolBar()
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                NotesBottomToolBar()
            }
        }
        .background(Color.clear.opacity(0.3))
    }
    
    func createSection(header: String, notes: [Note]) -> some View {
        Section(header: SectionHeaderView(text: header, capitalization: .none)) {
            ForEach(notes) { note in
                NavigationLink(destination: WrittenNoteView(note: note)) {
                    VStack(alignment: .leading) {
                        Text(note.title)
                            .font(.headline)
                        
                        HStack {
                            Text(note.time)
                            
                            let secondChar = note.description.dropFirst().first
                            
                            if secondChar == "." {
                                Text(note.description.dropFirst().dropFirst())
                            } else {
                                Text(note.description)
                            }
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    }
                }
            }
            .padding(.horizontal, 10)
        }
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
