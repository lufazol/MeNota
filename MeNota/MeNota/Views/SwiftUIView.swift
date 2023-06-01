//
//  BlankNoteView.swift
//  MeNota
//
//  Created by Luan Fazolin on 24/05/23.
//

import SwiftUI
import PencilKit

struct BlankNoteView2: View {
    @State private var title: String = ""
    @State private var text: String = ""
    @State var isChecked: Bool = false
    @StateObject var SharedVar = sharedVar()
    private var canvasView = PKCanvasView()
    
    init(note: Note = Note(id: 0, title: "", description: "", tag: "", time: "", date: Date.now, folderID: 0)) {
           _title = State(initialValue: note.title)
           _text = State(initialValue: note.description)

           UITextField.appearance().clearButtonMode = .never
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
                        VStack{
                            Text(title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 26))
                                .padding(.horizontal)
                                .padding(.bottom, 0)
                                .fontWeight(.bold)
                            Text(text)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.clear)
                            MyCanvas(canvasView: canvasView)
                            
                        }
                    }
                
                else{
                    TextField("Title", text: $title)
                    .font(.system(size: 26))
                    .padding(.horizontal)
                    .padding(.bottom, 0)
                    .fontWeight(.bold)
                    TextEditor(text: $text)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.clear)
                }
                
                Spacer()
                
            }.toolbar{
                ToolbarItemGroup(placement: .bottomBar) {
                    BlankNoteBottomToolBar(isChecklistPressed: SharedVar, isCanvasPressed: SharedVar, isNewNotePressed: SharedVar, text: $text)
                }
                
                if SharedVar.isCanvasPressed {
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
                } else {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        BlankNoteTopToolBar()
                    }
                }
            }
        .navigationBarTitleDisplayMode(.inline)
    }
}
                            
struct BlankNoteView_Previews: PreviewProvider {
    static var previews: some View {
        BlankNoteView2()
    }
}
