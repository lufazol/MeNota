//
//  SearchTopToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 25/05/23.
//

import SwiftUI

struct SearchTopToolBar: View {
    @Environment(\.presentationMode) var presentationMode // Access the presentation mode

    @State var dataArray: [String] = []
    @StateObject private var folderList = FolderList()
    @State private var searchText = ""
    
    var filteredNotes: [Note] {
        if searchText.isEmpty {
            return folderList.data.flatMap { $0.notes.noteList }
        } else {
            return folderList.data.flatMap { $0.notes.noteList.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.description.localizedCaseInsensitiveContains(searchText)
            }}
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                SearchBar(text: $searchText)
                    .padding(.leading)
                    .padding(.trailing, -10)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Dismiss the current view
                }) {
                    Text("Cancel")
                        .padding()
                        .foregroundColor(.accentColor)
                }
            }
            
            List(filteredNotes) { note in
                VStack(alignment: .leading) {
                    Text(note.title)
                        .font(.headline)
                    Text(note.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Tag: \(note.tag)")
                        .font(.caption)
                        .foregroundColor(.blue)
                    Text("Time: \(note.time)")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                .padding(.vertical, 8)
            }
        }
    }
}

struct SearchTopToolBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchTopToolBar()
    }
}
