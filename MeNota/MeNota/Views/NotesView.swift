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
        NavigationView {
            VStack {
                SearchBar()
                    .padding(.top, -15)
                
                List {
                    Section(header: SectionHeaderView(text: "Yesterday", capitalization: .none)) {
                        ForEach(dotlessNoteList) { preview in
                            VStack(alignment: .leading) {
                                Text(preview.title)
                                    .font(.headline)
                                
                                // doesn't show number if the first character is a digit
                                if let firstLine = preview.description.split(separator: "\n").first {
                                    let descriptionText = firstLine.trimmingCharacters(in: .whitespacesAndNewlines)
                                    let numberRange = descriptionText.rangeOfCharacter(from: .decimalDigits)
                                    let cleanText = numberRange.map { String(descriptionText[$0.upperBound...]) } ?? descriptionText

                                    HStack {
                                        Text(preview.time)
                                        Text(cleanText)
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal, -16)
            }
            .padding()
            
            // to make it work on light mode:
            // .background(Color(UIColor.systemGray6))
            
            .navigationBarTitle("Notes")
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
