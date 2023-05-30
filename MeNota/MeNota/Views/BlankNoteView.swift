//
//  BlankNoteView.swift
//  MeNota
//
//  Created by Luan Fazolin on 24/05/23.
//

import SwiftUI
import PencilKit

struct BlankNoteView: View {
    @State private var text: String = ""
    @State var isChecked: Bool = false
    @StateObject var SharedVar = sharedVar()
    private var canvasView = PKCanvasView()
    
    func clear(){
        text = ""
    }
    
    func toggle(){isChecked = !isChecked}
    
    var body: some View {
            VStack {
                if SharedVar.isChecklistPressed{
                    HStack{
                        Button(action: toggle) {
                            Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                        }
                        TextField("", text: $text)
                    }.padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.clear)
                }
                
                else if SharedVar.isCanvasPressed{
                        VStack {
                            MyCanvas(canvasView: canvasView)
                        }
                        .toolbar{
                            ToolbarItemGroup(placement: .principal) {
                                HStack {
                                    Button(action: {
                                        // Perform action for the first toolbar button
                                    }) {
                                        Image(systemName: "arrow.uturn.left.circle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                    }

                                    Button(action: {
                                        // Perform action for the first toolbar button
                                    }) {
                                        Image(systemName: "arrow.uturn.right.circle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                    }
                                }
                                .padding()
                            }
                            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                HStack {
                                    Button(action: {
                                        // Perform action for the first toolbar button
                                    }) {
                                        Image(systemName: "ellipsis.circle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                    }

                                    Button(action: {
                                        // Perform action for the second toolbar button
                                    })
                                    {
                                        Text("Done")
                                    }
                                }
                                .padding(.leading)
                            }
                        }
                    }
                
             
                
                else{
                    TextEditor(text: $text)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.clear)
                }
                
                Spacer()
                
            }.toolbar{
                ToolbarItemGroup(placement: .bottomBar) {
                    BlankNoteBottomToolBar(isChecklistPressed: SharedVar, isCanvasPressed: SharedVar, isNewNotePressed: SharedVar)
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
