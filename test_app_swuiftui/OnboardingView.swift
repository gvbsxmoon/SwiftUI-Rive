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
    @State var showModal: Bool = false
    
    var body: some View {
        ZStack {
            backgorund
            
            content
            
            Color
                .black
                .opacity(showModal ? 0.3 : 0)
                .ignoresSafeArea()
            
            if showModal {
                SignInView()
                    .transition(
                        .move(edge: .bottom)
                    )
                    .overlay(Button(action: {
                        withAnimation(.spring()) {
                            showModal = false
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding(8)
                            .background(.white)
                            .cornerRadius(.infinity)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    }))
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
    
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Learn design & code")
                .font(.custom("Poppins Bold", size: 60))
            
            Text("Don’t skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.")
                .customFont(.body)
                .opacity(0.7)
            
            Spacer()
            
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()) {
                            showModal = true
                        }
                    }
                }
            
            Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.")
                .customFont(.footnote)
                .opacity(0.7)
        }
        .padding(40)
        .padding([.top, .bottom], 40)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
