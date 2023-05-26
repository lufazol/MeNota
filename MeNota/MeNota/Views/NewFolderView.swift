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

    var body: some View {
        NavigationView {
            VStack {
    
                SearchBar().padding()
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
