//
//  BlankNoteView.swift
//  MeNota
//
//  Created by Luan Fazolin on 24/05/23.
//

import SwiftUI

struct BlankNoteView: View {
    @State private var text: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Type note", text: $text).padding()
                Spacer()
            }.toolbar{
                ToolbarItemGroup(placement: .bottomBar) {
                    BlankNoteBottomToolBar()
                }
            }
        }.toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                BlankNoteTopToolBar()
            }
        }

    }
}

struct BlankNoteView_Previews: PreviewProvider {
    static var previews: some View {
        BlankNoteView()
    }
}
