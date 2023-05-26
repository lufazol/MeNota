//
//  BlankNoteBottomToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 24/05/23.
//

import SwiftUI

struct BlankNoteBottomToolBar: View {
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isShowPhotoLibrary = false
    @State private var isShowCamera = false
    
    var body: some View {
        HStack {
            Button(action: {
                // Perform action for the first toolbar button
            }) {
                Image(systemName: "checklist")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()
            
            Spacer()
            
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .contextMenu {
                        Button {
                            self.sourceType = .photoLibrary
                            self.isShowPhotoLibrary = true
                        } label: {
                            Label("Choose Photo or Video", systemImage: "photo.on.rectangle")
                        }
                        
                        Button {
                            print("Scan Documents")
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
                            print("Scan Text")
                        } label: {
                            Label("Scan Text", systemImage:"text.viewfinder")
                        }
                    }.sheet(isPresented: self.$isShowPhotoLibrary) {
                        ImagePickerView(selectedImage: self.$selectedImage, sourceType: .photoLibrary)}
                    .sheet(isPresented: self.$isShowCamera) {
                        ImagePickerView(selectedImage: self.$selectedImage, sourceType: .camera)}
            }
            
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

struct BlankNoteBottomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        BlankNoteBottomToolBar()
    }
}
