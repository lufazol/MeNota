//
//  SwiftUIView.swift
//  MeNota
//
//  Created by Larissa Okabayashi on 24/05/23.
//
import UIKit
import PencilKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpPencilKit()
    }
    
    func setUpPencilKit() {
        let canvasView = PKCanvasView(frame: self.view.bounds)
        guard let window = view.window, let toolPicker = PKToolPicker.shared(for: window)
            else { return }
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
        view.addSubview(canvasView)
    }
}


