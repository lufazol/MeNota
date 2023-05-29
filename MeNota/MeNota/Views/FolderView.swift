//
//  ContentView.swift
//  MeNota
//
//  Created by Luan Fazolin on 22/05/23.
//

import SwiftUI

import SwiftUI

struct FolderView: View {
    @State private var showingNewFolderView = false

    var body: some View {
        NavigationView {
            List {
                Section(header: SectionHeaderView(text: "iCloud", capitalization: .none).padding(.top, -10)) {
                    ForEach(folderList) { folder in
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
            .navigationBarItems(trailing: NavigationLink(destination: CanvasView()) {
                Text("Edit")
            })
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    FolderToolbar(action: { showingNewFolderView.toggle() })
                }
            }
            
        }
        .accentColor(.yellow)
        .navigationViewStyle(StackNavigationViewStyle())
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
