//
//  ContentView.swift
//  Animation
//
//  Created by Joseph Langat on 02/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3,autoreverses: true)
            ), in: 1...10)
            Spacer()
            Button("Tap Me"){
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
//            .overlay(
//                Circle()
//                    .stroke(.red)
//                    .scaleEffect(animationAmount)
//                    .opacity(2 - animationAmount)
//                    .animation(
//                        .easeInOut(duration: 1)
//                        .repeatForever(autoreverses: false),
//                        value: animationAmount
//                    )
//            )
//            .onAppear {
//                animationAmount = 2
//            }
        }
       
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.default, value: animationAmount)
//        .animation(.interpolatingSpring(stiffness: 50, damping:1), value: animationAmount)
//        .animation(.easeInOut(duration: 2).delay(1), value: animationAmount)
//        .animation(.easeInOut(duration: 1).repeatCount(3, autoreverses: true), value: animationAmount)
//        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animationAmount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
