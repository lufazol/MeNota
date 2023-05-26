//
//  ContentView.swift
//  MeNota
//
//  Created by Luan Fazolin on 22/05/23.
//

import SwiftUI

struct FolderView: View {
    
    @State private var showingNewFolderView = false

    var body: some View {
        NavigationView {
            
            VStack {
                HStack {
                    Text("iCloud").bold().font(.system(size: 22)).padding(.top, 24).padding(.horizontal, 32)
                    Spacer()
                }
                List(folderList) { folder in
                    NavigationLink(destination: NotesView()) {
                        HStack {
                            Image(systemName: folder.icon).foregroundColor(.yellow)
                            Text(folder.title)
                            Spacer()
                            Text("\(folder.quantity)").foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
                
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            FolderToolbar(action: { showingNewFolderView.toggle() })
                        }
                    }
                
                    .navigationBarTitle("Folders")
                    .navigationBarItems(
                        trailing: NavigationLink(destination: CanvasView()) {
                                    Text("Edit")
                        })
                
            }
        }.accentColor(.yellow)
            .sheet(isPresented: $showingNewFolderView) {
                NewFolderView()
            }
        
    }
}

struct FolderView_Previews: PreviewProvider {
    static var previews: some View {
        FolderView()
    }
}
