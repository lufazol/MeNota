//
//  ContentView.swift
//  MeNota
//
//  Created by Luan Fazolin on 22/05/23.
//

import SwiftUI




struct FolderView: View {
    @State private var showingNewFolderView = false
    @StateObject var folderList = FolderList()

    var body: some View {
        NavigationView {
            List {
                Section(header: SectionHeaderView(text: "iCloud", capitalization: .none)) {
                    ForEach(folderList.data) { folder in
                        NavigationLink(destination: NotesView()) {
                            HStack {
                                Image(systemName: folder.icon)
                                    .foregroundColor(.yellow)
                                Text(folder.title)
                                Spacer()
                                Text("\(folder.quantity)")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            .navigationBarTitle("Folders")
            .navigationBarItems(trailing: NavigationLink(destination: BlankNoteView()) {
                Text("Edit")
            })
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    FolderToolbar(action: { showingNewFolderView.toggle() })
                }
            }
            
        }
        // the line below fixes the problems we were having with the bottom toolbar disappearing when outside of a redeclaration of a navigation view
        .accentColor(.yellow)
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showingNewFolderView) {
            NewFolderView(folderList: folderList)
        }
        
    }
}
