//
//  Lottie.swift
//  SwiftUI-Weather
//
//  Created by Admin on 4/6/21.
//

import SwiftUI
import Lottie

struct Lottie: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<Lottie>) -> some UIView {
        let view = UIView()
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Lottie>) {
        uiView.subviews.forEach ({ $0.removeFromSuperview() })
            
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: uiView.heightAnchor)
        ])
        
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
    }
}


