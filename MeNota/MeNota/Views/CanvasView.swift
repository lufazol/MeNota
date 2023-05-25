import SwiftUI
import PencilKit

struct CanvasView: View {
    private var canvasView = PKCanvasView()

    var body: some View {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}

struct MyCanvas: UIViewRepresentable {
    var canvasView: PKCanvasView
    let picker = PKToolPicker.init()
    
    func makeUIView(context: Context) -> PKCanvasView {
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        self.canvasView.becomeFirstResponder()
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        picker.addObserver(canvasView)
        picker.setVisible(true, forFirstResponder: uiView)
        DispatchQueue.main.async {
            uiView.becomeFirstResponder()
        }
    }
}

/*
import SwiftUI

import PencilKit

struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var canvas = PKCanvasView()
    @State var isdraw = true
    @State var color: Color = .black
    @State var type: PKInkingTool.InkType = .pencil
    @State var colorPicker = false
    
    // default is pen
    
    var body: some View {
        
        NavigationView {
            
            // Drawing View......
            
            DrawingView(canvas: $canvas, isdraw: $isdraw, type: $type, color: $color)
                .navigationTitle("Canvas")
                .font(.system(size: 35))
                .navigationBarTitleDisplayMode(.inline)
                .foregroundColor(Color.purple)
                .navigationBarItems(leading: Button(action: {
                    
                    // Saving Image.......
                    
                    saveImage()
                    
                }, label: {
                    Image(systemName: "square.and.arrow.down.fill")
                        .font(.title)
                        .foregroundColor(Color.orange)
                }), trailing: HStack(spacing: 15) {
                    
                    Button(action: {
                        
                        // erase tool
                        
                        isdraw = false
                        
                        isdraw.toggle()
                        
                    }) {
                        
                        Image(systemName: "pencil.slash")
                            .font(.title)
                            .foregroundColor(Color.orange)
                    }
                    
                    Menu {
                        
                        // ColorPicker
                        
                        ColorPicker(selection: $color) {
                            
                            Button(action: {
                                
                                colorPicker.toggle()
                            }) {
                                Label {
                                    
                                    Text("Color")
                                } icon: {
                                    
                                    Image(systemName: "eyedropper.full")
                                        .foregroundColor(Color.orange)
                                }
                                
                            }
                            
                        }
                        
                        
                        Button(action: {
                            
                            // changing type
                            
                            isdraw = true
                            type = .pencil
                        }) {
                            
                            Label {
                                
                                Text("Pencil")
                            } icon: {
                                
                                Image(systemName: "pencil")
                            }
                            
                        }
                        
                        Button(action: {
                            isdraw = true
                            type = .pen
                        }) {
                            
                            Label {
                                
                                Text("Pen")
                            } icon: {
                                
                                Image(systemName: "pencil.tip")
                            }
                            
                        }
                        Button(action: {
                            isdraw = true
                            type = .marker
                        }) {
                            
                            Label {
                                
                                Text("Marker")
                            } icon: {
                                
                                Image(systemName: "highlighter")
                            }
                            
                        }
                        
                        
                    } label: {
                        Image(systemName: "menubar.dock.rectangle")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(Color.orange)
                    }
                    
                    
                })
                .sheet(isPresented: $colorPicker) {
                    
                   ColorPicker("Pick Color", selection: $color)
                    .padding()
                }
            
            
        }
    }
    
    func saveImage() {
        
        // getting image from Canvas
        
        let image = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1)
        
        // saving to album
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        
    }
}

struct DrawingView: UIViewRepresentable {
    // to capture drawings for saving into albums
    @Binding var canvas: PKCanvasView
    @Binding var isdraw: Bool
    @Binding var type: PKInkingTool.InkType
    @Binding var color: Color
    
    
    // Updating inktype
    
     var ink : PKInkingTool {
        
        PKInkingTool(type, color: UIColor(color))
    }
    
    let eraser = PKEraserTool(.bitmap)
    
    func makeUIView(context: Context) -> PKCanvasView {
        
        canvas.drawingPolicy = .anyInput
        canvas.tool = isdraw ? ink : eraser
        
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // updating the tool whenever the view updates
        
        uiView.tool = isdraw ? ink : eraser
        
    }
}

 //
 //  CanvasView.swift
 //  MeNota
 //
 //  Created by Larissa Okabayashi on 23/05/23.
 //

 import SwiftUI
 import PencilKit

 struct Line {
     var points = [CGPoint]()
     var color: Color = .red
     var linewidth: Double = 1.0
 }

 struct MyCanvas: UIViewRepresentable {
     @Binding var canvasView: PKCanvasView

     func makeUIView(context: Context) -> PKCanvasView {
         canvasView.drawingPolicy = .anyInput
         canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
         return canvasView
     }

     func updateUIView(_ canvasView: PKCanvasView, context: Context) { }
 }

 struct CanvasView: View{
     @State private var bgColor = Color.red
     @State private var currentLine = Line()
     @State private var lines: [Line] = []
     @State private var canvasView = PKCanvasView()

     var body: some View {

         VStack {
             Canvas{ context, size in
                 
                 for line in lines {
                     var path = Path()
                     path.addLines(line.points)
                     context.stroke(path, with: .color(line.color), lineWidth: line.linewidth)
                 }
                 
             }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
             .onChanged({value in
                 let newPoint = value.location
                 currentLine.points.append(newPoint)
                 self.lines.append(currentLine)
             })
             .onEnded({value in
                 self.lines.append(currentLine)
                 self.currentLine = Line(points: [], color: currentLine.color)
             })
             )
             
             ColorPicker("", selection: $bgColor).onChange(of: bgColor) {
                 newColor in
                 currentLine.color = newColor
             }
             
             MyCanvas(canvasView: $canvasView)
             
         }.frame(maxWidth: .infinity, maxHeight: .infinity)
         .background(.white)
         .padding()
     }
 }

 struct CanvasView_Previews: PreviewProvider {
     static var previews: some View {
         CanvasView()
     }
 }
*/

