//
//  CircularProgressView.swift
//  TMDBApp
//
//  Created by Matheus dos Reis de Jesus on 25/06/22.
//

import SwiftUI

struct CircularProgressView: View {
    @State private var isAnimating = false
    @State private var size = 20.0
    
    private func animate() {
        withAnimation {
            isAnimating.toggle()
        }
    }
    
    func size(_ value: CGFloat) -> CircularProgressView {
        self.size = value
        return self
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.8)
            .stroke(
                Color.blue,
                lineWidth: size*0.10
            )
            .frame(width: size, height: size)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .animation(
                .linear(duration: 1.0).repeatForever(autoreverses: false),
                value: isAnimating
            )
            .onAppear { animate() }
            .onDisappear { animate() }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}
