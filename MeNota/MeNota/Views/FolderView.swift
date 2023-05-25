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
                HStack {
                    Text("iCloud").bold().font(.system(size: 22))
                    Spacer()
                }.padding(.horizontal, 16)
                List(noteList) { note in
                          HStack {
                            Text(note.title)
                          }
                        }
                Spacer()
            }.toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {}) {
                        Image(systemName: "folder.badge.plus")
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            .navigationBarTitle("Folders")
            .navigationBarItems(trailing:
             NavigationLink(destination: CanvasView()) {
                 Text("Edit")
                }
            )
            .padding(16)
        }
        .accentColor(.yellow)
    }
}

