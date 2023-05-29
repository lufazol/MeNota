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

    // testing with the first item of noteList
    init() {
        guard let firstNote = noteList.first else {
            fatalError("No notes available")
        }
        _title = State(initialValue: firstNote.title)
        _text = State(initialValue: firstNote.description)
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $title)
                    .font(.title)
                    .padding()

                TextEditor(text: $text)
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                Spacer()
            }.toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    BlankNoteBottomToolBar()
                }
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
        WrittenNoteView()
    }
}
