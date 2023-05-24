//
//  CanvasView.swift
//  MeNota
//
//  Created by Larissa Okabayashi on 23/05/23.
//

import SwiftUI

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var linewidth: Double = 1.0
}

struct CanvasView: View {
    @State private var bgColor = Color.red
    @State private var currentLine = Line()
    @State private var lines: [Line] = []

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
