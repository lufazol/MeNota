//
//  NotesTopToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 26/05/23.
//

import SwiftUI

struct NotesTopToolBar: View {
    var body: some View {
        HStack {
            Spacer()

            Menu {
                HStack {
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "list.bullet")
                            Text("View as List")
                    }
                    Divider()
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "checkmark.circle")
                            Text("Select Notes")
                    }
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "arrow.up.arrow.down")
                            Text("Sort By")
                    }
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "calendar")
                            Text("Group By Date")
                    }
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "paperclip")
                            Text("View Attachments")
                    }
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)

            }
            .padding()
        }
    }
}

struct NotesTopToolBar_Previews: PreviewProvider {
    static var previews: some View {
        NotesTopToolBar()
    }
}
