//
//  NotesBottomToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 29/05/23.
//

import SwiftUI

struct NotesBottomToolBar: View {
    var notesNumber: String
    var body: some View {
        Spacer()

        Text(notesNumber)
            .font(.system(size: 14))
    
        Spacer()
                            
        NavigationLink(destination: BlankNoteView()) {
            Image(systemName: "square.and.pencil")
        }
    }
}
