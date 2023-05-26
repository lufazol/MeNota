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
    @State private var texto: String = "New folder"
    
    var body: some View {
        NavigationView {
            VStack {
    
                TextField("Digite aqui", text: $texto)
                    .cornerRadius(14)
                    .frame(height: 44)
                    .background(.gray)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                        texto = "Texto pré-escrito"
                                    }
                                }
                Spacer()
                    
            }.toolbar {
                ToolbarItemGroup(placement: .principal) {
                    NewFolderToolbar {
                        dismiss()
                    }
                }
                
            }
        }
    }
}

