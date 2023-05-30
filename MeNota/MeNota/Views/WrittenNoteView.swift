//
//  WrittenNoteView.swift
//  MeNota
//
//  Created by Larissa Fazolin on 29/05/23.
//

import SwiftUI

struct WrittenNoteView: View {
    @State private var title: String
    @State private var text: String
    @StateObject var SharedVar = sharedVar()

    init(note: Note) {
        _title = State(initialValue: note.title)
        _text = State(initialValue: note.description)
    }

    var body: some View {
            VStack {
                TextField("Title", text: $title)
                    .font(.title)
                    .padding(.horizontal)
                    .padding(.bottom, 0)

                TextEditor(text: $text)
                    .padding(.leading, 25)
                    .padding(.top, -10)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                Spacer()
            }.toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    BlankNoteBottomToolBar(isChecklistPressed: SharedVar)
                }
            }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
            HStack {
                Spacer()
                BlankNoteTopToolBar()
            }
        )
    }
}

struct WrittenNoteView_Previews: PreviewProvider {
    static var previews: some View {
        let noteList = NoteList()
        if let firstNote = noteList.note.first {
            return WrittenNoteView(note: firstNote)
        } else {
            return WrittenNoteView(note: Note(id: 0, title: "", description: "", tag: "", time: ""))
        }
    }
}
