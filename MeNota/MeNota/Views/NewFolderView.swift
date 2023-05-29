//
//  NewFolderView.swift
//  MeNota
//
//  Created by Carol Quiterio on 25/05/23.
//

import Foundation
import SwiftUI

struct NewFolderView: View {
    @Environment(\.dismiss) var dismiss
    @State private var text: String = "New folder"
    
    init() {
            UITextField.appearance().clearButtonMode = .always
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("", text: $text)
                        .onSubmit {
                            
                        }
                        
                }.padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
                    .background(Color(.systemGray5))
                    .frame(height: 44)
                    .cornerRadius(12)
                    .accentColor(.yellow)
                    
                    
                Spacer()
                    
            }.toolbar {
                ToolbarItemGroup(placement: .principal) {
                    NewFolderToolbar {
                        dismiss()
                    }
                }
                
            }
            .padding()
        }
    }
}

