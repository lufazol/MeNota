//
//  BlankNoteView.swift
//  MeNota
//
//  Created by Luan Fazolin on 24/05/23.
//

import SwiftUI

struct BlankNoteView: View {
    @State private var text: String = ""
    @State var isChecked: Bool = false
    
    func toggle(){isChecked = !isChecked}
    
    var body: some View {
        NavigationView {
            VStack {
                if sharedVar.shared.isChecklistPressed{
                    HStack{
                        Button(action: toggle) {
                            Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                        }
                        TextField("Type note", text: $text)
                    }.padding()
                }
                else{
                    TextField("Type note", text: $text).padding()
                }
                
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

struct BlankNoteView_Previews: PreviewProvider {
    static var previews: some View {
        BlankNoteView()
    }
}
