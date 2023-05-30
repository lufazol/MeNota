//
//  BlankNoteBottomToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 24/05/23.
//

import SwiftUI

class sharedVar: ObservableObject{
    @Published var isChecklistPressed = false
    func toggle(){
        isChecklistPressed = true
    }
}

struct BlankNoteBottomToolBar: View {
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isShowPhotoLibrary = false
    @State private var isShowCamera = false
    @ObservedObject var isChecklistPressed: sharedVar
    
    var body: some View {
        HStack {
            Button(action: {
                isChecklistPressed.toggle()
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
            
            NavigationLink(
                destination: CanvasView())
                {
                    Image(systemName: "pencil.tip.crop.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }
                .padding()

            
            Spacer()

            Button(action: {
                // Perform action for the second toolbar button
            }) {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()

        }
    }
}
