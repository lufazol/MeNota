//
//  BlankNoteTopToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 24/05/23.
//

import SwiftUI

struct BlankNoteTopToolBar: View {
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                // Perform action for the first toolbar button
            }) {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()

            Button(action: {
                // Perform action for the second toolbar button
            }) {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()
        }
    }
}

struct BlankNoteTopToolBar_Previews: PreviewProvider {
    static var previews: some View {
        BlankNoteTopToolBar()
    }
}
