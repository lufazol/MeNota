//
//  BlankNoteView.swift
//  MeNota
//
//  Created by Luan Fazolin on 24/05/23.
//

import SwiftUI
import PencilKit

struct BlankNoteView: View {
    @FocusState private var isFocused: Bool
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
                    .focused($isFocused)
                    .padding(.bottom, 0)
                    .fontWeight(.bold)
                    TextEditor(text: $text)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .focused($isFocused)
                        .background(Color.clear)
                }
                
                Spacer()
                
            }.toolbar{
                // bottom toolbar showed during whole view
                ToolbarItemGroup(placement: .bottomBar) {
                    BlankNoteBottomToolBar(isChecklistPressed: SharedVar, isCanvasPressed: SharedVar, isNewNotePressed: SharedVar, text: $text)
                }
                
                // top toolbar if canvas is showing
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
                                    .frame(width: 22, height: 22)
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
                
                // top toolbar if textfield is active
                else if isFocused {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        HStack {
                            Button(action: {
                                // Perform action for the share button
                                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                      let window = windowScene.windows.first else {
                                    return
                                }
                                
                                let shareSheet = UIActivityViewController(activityItems: ["Sharing content"], applicationActivities: nil)
                                window.rootViewController?.present(shareSheet, animated: true, completion: nil)
                            }) {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 22, height: 22)
                            }

                            Menu {
                                HStack {
                                    Button {
                                        print("Test")
                                    } label: {
                                            Image(systemName: "squareshape.split.3x3")
                                            Text("Lines & Grids")
                                    }
                                }
                            } label: {
                                Image(systemName: "ellipsis.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 22, height: 22)

                            }
                            .padding()
                            
                            Button {
                                // add note
                            } label: {
                                    Text("Done")
                            }
                        }
                    }
                }

                // top toolbar if neither canvas nor textfield is active
                else {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        BlankNoteTopToolBar()
                    }
                }
            }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                self.keyboardVisible = true
            }

            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                self.keyboardVisible = false
            }
        }
        .onTapGesture {
            if keyboardVisible {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
    @State private var keyboardVisible = false
}
                            
struct BlankNoteView_Previews: PreviewProvider {
    static var previews: some View {
        BlankNoteView()
    }
}
