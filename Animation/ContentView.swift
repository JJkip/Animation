//
//  ContentView.swift
//  Animation
//
//  Created by Joseph Langat on 02/06/2023.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    @State private var isShowingPink = false
    let letters = Array("Hello, SwiftUI")
    @State private var isShowingRectangle  = false
    @State private var enabledB = false
    @State private var dragAmountB = CGSize.zero
    @State private var animationAmount = 1.0
    @State private var exAnimationAmount = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.purple)
                .frame(width: 200, height: 200)
            
            if isShowingPink {
                Rectangle()
                    .fill(.pink)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingPink.toggle()
            }
        }
        /*
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRectangle.toggle()
                }
            }
            if isShowingRectangle {
                Rectangle()
                    .fill(.purple)
                    .frame(width: 200, height: 200)
//                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
         */
        /*
        HStack(spacing: 0){
            ForEach(0..<letters.count){ num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabledB ? .pink : .purple)
                    .offset(dragAmountB)
                    .animation(
                        .default.delay(Double(num) / 20),
                        value: dragAmountB)
            }
        }
        .gesture(
            DragGesture()
                .onChanged {dragAmountB = $0.translation}
                .onEnded { _ in
                    dragAmountB = .zero
                    enabledB.toggle()
                }
        )
         */
        /*
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
            Spacer()
            Button("Click Me"){
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)){
                    exAnimationAmount += 360
                }
            }
            .padding(50)
            .background(.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(exAnimationAmount), axis: (x: 0, y: 1, z: 0))
            Spacer()
            Button("Press ME"){
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .green)
            .animation(nil, value: enabled)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1 ), value: enabled)
            Spacer()
            LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged {dragAmount = $0.translation}
                        .onEnded { _ in
                            withAnimation {
                                dragAmount = .zero
                            }
                        }
                )
            Spacer()
           
//                .animation(.spring(), value: dragAmount)
            
           
//            .animation(.default, value: enabled)
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
         
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
