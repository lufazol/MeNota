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

struct CanvasView_Previews: PreviewProvider {
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
