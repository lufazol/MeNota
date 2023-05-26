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
                    .frame(width: 20, height: 20)
            }

            Menu {
                HStack {
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "magnifyingglass")
                            Text("Find in Note")
                    }
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "folder")
                            Text("Move Note")
                    }
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "squareshape.split.3x3")
                            Text("Lines & Grids")
                    }
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "circle.righthalf.filled")
                            Text("Use Light Background")
                    }
                    Button(role: .destructive) {
                        print("Test")
                    } label: {
                            Image(systemName: "trash")
                            Text("Delete")
                    }
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)

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
