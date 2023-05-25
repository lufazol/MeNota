//
//  BlankNoteBottomToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 24/05/23.
//

import SwiftUI

struct BlankNoteBottomToolBar: View {
    var body: some View {
        HStack {
            Button(action: {
                // Perform action for the first toolbar button
            }) {
                Image(systemName: "checklist")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                // Perform action for the first toolbar button
            }) {
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()

            
            Spacer()
            
            NavigationLink(
                destination: CanvasView())
                {
                    Image(systemName: "pencil.tip.crop.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }
                .padding()

            
            Spacer()

            Button(action: {
                // Perform action for the second toolbar button
            }) {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()

        }
    }
}

struct BlankNoteBottomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        BlankNoteBottomToolBar()
    }
}
