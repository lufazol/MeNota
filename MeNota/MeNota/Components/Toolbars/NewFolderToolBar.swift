//
//  NewFolderToolBar.swift
//  MeNota
//
//  Created by Carol Quiterio on 25/05/23.
//

import Foundation
import SwiftUI

struct NewFolderToolbar: View {
    let action: () -> Void
    
    var body: some View {
        HStack {
            Button { action() } label: {
                Text("Cancel")
                    .foregroundColor(.yellow)
            }
            
            Spacer()
            Text("New Folder").fontWeight(.semibold)
            Spacer()
            
            NavigationLink(destination: BlankNoteView()) {
                Text("   OK").fontWeight(.semibold)
                    .foregroundColor(.yellow)
            }
        }
        
    }
}
