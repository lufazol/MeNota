//
//  FolderToolbar.swift
//  MeNota
//
//  Created by Carol Quiterio on 25/05/23.
//

import Foundation
import SwiftUI

struct FolderToolbar: View {
    let action: () -> Void
    
    var body: some View {
        HStack {
            Button { action() } label: {
                Image(systemName: "folder.badge.plus")
            }
            
            Spacer()

            NavigationLink(destination: BlankNoteView()) {
                Image(systemName: "square.and.pencil")
            }
        }
    }
}
