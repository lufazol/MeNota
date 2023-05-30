//
//  NewFolderToolBar.swift
//  MeNota
//
//  Created by Carol Quiterio on 25/05/23.
//

import Foundation
import SwiftUI

struct NewFolderToolbar: View {
    let okAction: () -> Void
    let cancelAction: () -> Void
    
    var body: some View {
        HStack {
            Button { cancelAction() } label: {
                Text("Cancel")
                    .foregroundColor(.yellow)
            }
            
            Spacer()
            Text("New Folder").fontWeight(.semibold)
            Spacer()
            
            Button { okAction() } label: {
                Text("Done").fontWeight(.bold)
                    .foregroundColor(.yellow)
            }
        }
    }
}
