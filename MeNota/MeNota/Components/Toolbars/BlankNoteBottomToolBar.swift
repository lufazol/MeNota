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
    @State private var isImagePickerDisplay = false
    
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
                            self.isImagePickerDisplay.toggle()
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
                            self.isImagePickerDisplay.toggle()
                        } label: {
                            Label("Take Photo or Video", systemImage:"camera")
                        }.padding()
                        
                        Button {
                            print("Scan Text")
                        } label: {
                            Label("Scan Text", systemImage:"text.viewfinder")
                        }
                    }.sheet(isPresented: self.$isImagePickerDisplay) {
                        ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                    }
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
