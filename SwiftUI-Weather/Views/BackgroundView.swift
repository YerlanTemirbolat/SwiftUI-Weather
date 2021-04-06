//
//  BackgroundView.swift
//  SwiftUI-Weather
//
//  Created by Admin on 4/6/21.
//

import SwiftUI

struct BackgroundView: View {
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.purple, Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
