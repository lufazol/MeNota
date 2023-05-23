//
//  ContentView.swift
//  MeNota
//
//  Created by Luan Fazolin on 22/05/23.
//

import SwiftUI

struct FolderView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Oie")
            }
            .navigationBarTitle("Folders")
            .navigationBarItems(trailing:
            NavigationLink(destination: CanvasView()) {
                 Text("Edit")
                }
            )
        }
        .accentColor(.yellow)
    }
}
