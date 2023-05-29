//
//  NotesView.swift
//  MeNota
//
//  Created by Larissa Fazolin on 24/05/23.
//

import SwiftUI

struct writtenNotes: Identifiable, Hashable {
    let title: String
    let subtitle: String
    let id = NSUUID().uuidString
}

struct NotesView: View {
    var body: some View {
        VStack {
            SearchBarButton()
                .padding(.top, -15)

            List {
                Section(header: SectionHeaderView(text: "Today", capitalization: .none)) {
                    ForEach(noteList.prefix(2)) { preview in
                        VStack(alignment: .leading) {
                            Text(preview.title)
                                .font(.headline)
                            
                            HStack {
                                Text(preview.time)
                                
                                let seccondChar = preview.description.dropFirst().first
                                
                                if (seccondChar == ".") {
                                    Text(preview.description.dropFirst().dropFirst())
                                } else {
                                    Text(preview.description)
                                }
                                
                            }.font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                        }
                    }
                    .padding(.horizontal, 10)
                }
                
                Section(header: SectionHeaderView(text: "Previous 7 Days", capitalization: .none)) {
                    ForEach(noteList.prefix(4).suffix(2)) { preview in
                        VStack(alignment: .leading) {
                            Text(preview.title)
                                .font(.headline)
                            
                            HStack {
                                Text(preview.time)
                                
                                let seccondChar = preview.description.dropFirst().first
                                
                                if (seccondChar == ".") {
                                    Text(preview.description.dropFirst().dropFirst())
                                } else {
                                    Text(preview.description)
                                }
                                
                            }.font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                            }
                    }
                    .padding(.horizontal, 10)
                }
                
            }
            .padding(.horizontal, -20)
        }
        .padding()
        .navigationBarTitle("Notes")
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NotesTopToolBar()
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                NotesBottomToolBar()
            }
        }
    }
}


struct SectionHeaderView: View {
    let text: String
    let capitalization: Text.Case?
    
    var body: some View {
        Text(text)
            .font(.title3.bold())
            .foregroundColor(.white)
            .textCase(capitalization)
            .alignmentGuide(.leading) { _ in 0 }
            .padding(.vertical, 5)
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
