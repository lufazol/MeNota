//
//  BlankNoteBottomToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 24/05/23.
//

import SwiftUI

class sharedVar: ObservableObject{
    @Published var isChecklistPressed = false
    @Published var isCanvasPressed = false
    @Published var isNewNotePressed = false
    
    
    
    func toggleChecklist(){
        isChecklistPressed = true
    }
    func toggleCanvas(){
        isCanvasPressed = true
    }
    func toggleNewNote(){
        isNewNotePressed = true
    }
}

struct BlankNoteBottomToolBar: View {
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isShowPhotoLibrary = false
    @State private var isShowCamera = false
    @ObservedObject var isChecklistPressed: sharedVar
    @ObservedObject var isCanvasPressed: sharedVar
    @ObservedObject var isNewNotePressed: sharedVar
    
    @Binding var text:String
    
    var body: some View {
        HStack {
            Button(action: {
                isChecklistPressed.toggleChecklist()
            }) {
                Image(systemName: "checklist")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()
            
            Spacer()
            
            Menu {
                Button {
                    self.sourceType = .photoLibrary
                    self.isShowPhotoLibrary = true
                } label: {
                    Label("Choose Photo or Video", systemImage: "photo.on.rectangle")
                }
                
                Button {
                    self.isShowCamera = true
                } label: {
                    Label("Scan Documents", systemImage:"doc.viewfinder")
                }
                
                Button {
                    self.sourceType = .camera
                    self.isShowCamera = true
                } label: {
                    Label("Take Photo or Video", systemImage:"camera")
                }.padding()
                
                Button {
                    self.isShowCamera = true
                } label: {
                    Label("Scan Text", systemImage:"text.viewfinder")
                }
            }label: {
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)

            }.sheet(isPresented: self.$isShowPhotoLibrary) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: .photoLibrary)}
            .sheet(isPresented: self.$isShowCamera) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: .camera)}
            
            Spacer()
            
            Button(action: {
                isCanvasPressed.toggleCanvas()
            }) {
                Image(systemName: "pencil.tip.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()
            
            Spacer()

            Button(action: {
                clearText()
                isNewNotePressed.toggleNewNote()
            }) {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()

        }
    }
    
    private func clearText() {
        text=""
    }
}
