//
//  OnboardingView.swift
//  test_app_swuiftui
//
//  Created by Luca Natale on 02/09/22.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button")
    
    var body: some View {
        ZStack {
            backgorund
            
            VStack(alignment: .leading) {
                Text("Leardn design & code")
                    .frame(width: 260, alignment: .leading)
                
                Text("Don’t skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.")
                    .frame(width: 260, alignment: .leading)
                button.view()
                    .frame(width: 236, height: 64)
                    .overlay(
                        Label("Start the course", systemImage: "arrow.forward")
                            .offset(x: 3, y: 4)
                            .font(.headline)
                    )
                    .background(
                        Color.black
                            .cornerRadius(30)
                            .blur(radius: 10)
                            .offset(y: 10)
                            .opacity(0.3)
                    )
                    .onTapGesture {
                        button.play(animationName: "active")
                }
            }
        }
    }
    
    var backgorund: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 30)
                    .offset(x: 200, y: 100)
            )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
