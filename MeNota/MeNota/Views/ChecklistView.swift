//
//  BlankNoteView.swift
//  MeNota
//
//  Created by Luan Fazolin on 24/05/23.
//

import SwiftUI

struct CheckListView: View {
    @State private var text: String = ""
    @State var isChecked: Bool = false
    func toggle(){isChecked = !isChecked}
    var body: some View {
        NavigationView {
            HStack{
                Button(action: toggle) {
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                }
                TextField("Type note", text: $text).padding()
                
                Spacer()
                
            }.toolbar{
                ToolbarItemGroup(placement: .bottomBar) {
                    BlankNoteBottomToolBar()
                }
            }
        }.toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                BlankNoteTopToolBar()
            }
        }
    }
}

struct CheckListView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}

