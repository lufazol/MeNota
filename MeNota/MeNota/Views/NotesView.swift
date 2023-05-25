//
//  NotesView.swift
//  MeNota
//
//  Created by Larissa Fazolin on 24/05/23.
//

import SwiftUI

struct NotesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("aaaaaaaaaaaaaaaaa")
            }
            .navigationBarTitle("Notes")
            .navigationBarItems(trailing:
            NavigationLink(destination: CanvasView()) {
                 Image(systemName: "ellipsis.circle")
            })
        }
        .accentColor(.yellow)
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
