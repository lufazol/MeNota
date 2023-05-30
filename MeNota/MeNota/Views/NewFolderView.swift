//
//  NewFolderView.swift
//  MeNota
//
//  Created by Carol Quiterio on 25/05/23.
//

import Foundation
import SwiftUI

struct NewFolderView: View {
    @ObservedObject var folderList: FolderList
    @Environment(\.dismiss) var dismiss
    @State private var text: String = "New folder"
    
    init(folderList: FolderList) {
        self.folderList = folderList
        UITextField.appearance().clearButtonMode = .always
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("", text: $text)
                        .onSubmit {
                            folderList.data.append(Folder(
                                id: folderList.data.count + 1,
                                title: text,
                                icon: "folder",
                                quantity: 0
                              ))
                            dismiss()
                        }
                        
                }.padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
                    .background(Color(.systemGray5))
                    .frame(height: 44)
                    .cornerRadius(12)
                    .accentColor(.yellow)
                    
                    
                Spacer()
                    
            }.toolbar {
                ToolbarItemGroup(placement: .principal) {
                    NewFolderToolbar (
                        okAction: {
                            folderList.data.append(Folder(
                                id: folderList.data.count + 1,
                                title: text,
                                icon: "folder",
                                quantity: 0
                              ))
                            dismiss()
                            
                        },
                        cancelAction: { dismiss() }
                    )
                }
                
            }
            .padding()
        }
    }
}
