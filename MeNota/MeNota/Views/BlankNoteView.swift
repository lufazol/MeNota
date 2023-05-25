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
                TextField("Type note", text: $text)
                Spacer()
            }
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar) {
                    BlankNoteBottomToolBar()
                }

                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    BlankNoteTopToolBar()
                }
            }
        }

    }
}

struct BlankNoteView_Previews: PreviewProvider {
    static var previews: some View {
        BlankNoteView()
    }
}
