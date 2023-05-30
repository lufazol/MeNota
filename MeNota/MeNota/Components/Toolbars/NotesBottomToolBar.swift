//
//  NotesBottomToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 29/05/23.
//

import SwiftUI

struct NotesBottomToolBar: View {
    var body: some View {
        Spacer()

        Text("4 Notes")
            .font(.system(size: 14))
    
        Spacer()
                            
        NavigationLink(destination: BlankNoteView()) {
            Image(systemName: "square.and.pencil")
        }
    }
}

struct NotesBottomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        NotesBottomToolBar()
    }
}
