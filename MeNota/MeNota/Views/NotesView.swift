//
//  NotesView.swift
//  MeNota
//
//  Created by Larissa Fazolin on 24/05/23.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var noteList: NoteList
    
    init(noteList: NoteList) {
        self.noteList = noteList
    }
    
    
    var body: some View {
        VStack {
            SearchBarButton()
                .padding(.top, -15)

            List {
                createSection(header: "Today", notes: noteList.noteList)
                
                createSection(header: "Previous 7 Days", notes: noteList.noteList)
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
