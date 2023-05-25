//
//  CanvasToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 25/05/23.
//

import SwiftUI

struct CanvasToolBar: View {
    var body: some View {
        HStack {
            Spacer()

            Button(action: {
                // Perform action for the first toolbar button
            }) {
                Image(systemName: "arrow.uturn.left.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }

            Button(action: {
                // Perform action for the first toolbar button
            }) {
                Image(systemName: "arrow.uturn.right.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                // Perform action for the first toolbar button
            }) {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }

            Button(action: {
                // Perform action for the second toolbar button
            })
            {
                Text("Done")
            }
            .padding()

        }
    }
}

struct CanvasToolBar_Previews: PreviewProvider {
    static var previews: some View {
        CanvasToolBar()
    }
}
