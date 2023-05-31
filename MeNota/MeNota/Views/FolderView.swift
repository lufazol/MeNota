//
//  ContentView.swift
//  MeNota
//
//  Created by Luan Fazolin on 22/05/23.
//

import SwiftUI

struct FolderView: View {
    @State private var isEditing: Bool = false
    @State private var showingNewFolderView = false
    @State private var IsPressedEditButton = false
    @StateObject var folderList = FolderList()

    var body: some View {
        NavigationView {
            List {
                Section(header: SectionHeaderView(text: "iCloud", capitalization: .none)) {
                    if !isEditing {
                        ForEach(folderList.data) { folder in
                            NavigationLink(destination: NotesView(noteList: folder.notes, title: folder.title)) {
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
                    else {
                        ForEach(folderList.data) { folder in
                            NavigationLink(destination: NotesView(noteList: folder.notes, title: folder.title)) {
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
                        .onMove(perform: self.move)
                        .onDelete(perform: delete)
                    }

                }
            }
            .listStyle(InsetGroupedListStyle())
            
            .navigationBarTitle("Folders")
            .navigationBarItems(trailing: Button("Edit"){
                isEditing.toggle()
            })
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    FolderToolbar(
                        noteList: folderList.data[0].notes,
                        action: { showingNewFolderView.toggle() }
                    )
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
    func move(from source: IndexSet, to destination: Int){
        folderList.data.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        folderList.data.remove(atOffsets: offsets)
    }
}
