//
//  SearchView.swift
//  MeNota
//
//  Created by Larissa Fazolin on 25/05/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var showFilteredResults = false
    @StateObject private var folderList = FolderList()
    
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
    
    let items = [
        (systemName: "person.crop.circle", text: "Shared Notes"),
        (systemName: "lock.fill", text: "Locked Notes"),
        (systemName: "checklist", text: "Notes with Checklists"),
        (systemName: "number", text: "Notes with Tags"),
        (systemName: "pencil.tip.crop.circle", text: "Notes with Drawings"),
        (systemName: "doc.viewfinder", text: "Notes with Scanned Documents"),
        (systemName: "paperclip", text: "Notes with Attachments")
    ]
    
    var body: some View {
        VStack {
            SearchTopToolBar(text: $searchText, showFilteredResults: $showFilteredResults)
                //.padding(.top, -50)
                .padding(.bottom, -10)
            
            if showFilteredResults && !searchText.isEmpty {
                let filteredNotesCount = filteredNotes.count
                
                List {
                    Section(header:
                        HStack {
                            SectionHeaderView(text: "Top Hits", capitalization: .none)
                            Spacer()
                            Text("\(filteredNotesCount) Found")
                                .textCase(.none)
                                .font(.headline.weight(.regular))
                                .foregroundColor(.secondary)
                        })
                        {
                        ForEach(filteredNotes) { note in
                            VStack(alignment: .leading) {
                                Text(note.title)
                                    .font(.headline)
                                
                                HStack {
                                    Text(note.time)
                                    
                                    let secondChar = note.description.dropFirst().first
                                    
                                    if secondChar == "." {
                                        Text(note.description.dropFirst().dropFirst())
                                    } else {
                                        Text(note.description)
                                    }
                                }
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                                .padding(.bottom, -5)
                                
                                if let folder = folderList.getFolderByID(note.folderID) {
                                    HStack {
                                        Image(systemName: folder.icon)
                                        Text(folder.title)
                                        Rectangle()
                                            .frame(width: 15, height: 1)
                                        Text("iCloud")
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                }
                            }
                            .padding(.leading, 10)
                        }
                    }
                }
                .padding(.vertical, -5)
                
            } else {
                List {
                    Section(header: SectionHeaderView(text: "Suggested", capitalization: .none)) {
                        ForEach(items, id: \.text) { item in
                            HStack(alignment: .top, spacing: 20) {
                                Image(systemName: item.systemName)
                                    .foregroundColor(.accentColor)
                                Text(item.text)
                            }
                        }
                        .alignmentGuide(.leading) { _ in 0 }
                    }
                }
                .listStyle(.plain)
                .padding(.vertical, -20)
                .padding(.horizontal, -5)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
