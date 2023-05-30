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
            VStack {
                if sharedVar.shared.isChecklistPressed{
                    HStack{
                        Button(action: toggle) {
                            Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                        }
                        TextField("Type note", text: $text)
                    }.padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.clear)
                }
                else{
                    TextField("Type note", text: $text)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.clear)
                }
                
                Spacer()
                
            }.toolbar{
                ToolbarItemGroup(placement: .bottomBar) {
                    BlankNoteBottomToolBar()
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    BlankNoteTopToolBar()
                }
            }
        .navigationBarTitleDisplayMode(.inline)
    }
}
                            
struct BlankNoteView_Previews: PreviewProvider {
    static var previews: some View {
        BlankNoteView()
    }
}
