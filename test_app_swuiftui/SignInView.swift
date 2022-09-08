//
//  SignInView.swift
//  test_app_swuiftui
//
//  Created by Luca Natale on 05/09/22.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Sign in")
                .customFont(.largeTitle)
            
            Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.")
                .customFont(.subheadline2)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subheadline)
                    .opacity(0.5)
                TextField("", text: $email)
                    .customTextField("Icon Email")
                    
                
                HStack {
                    Text("Password")
                        .customFont(.subheadline)
                        .opacity(0.5)
                    Spacer()
                    Button("Forgot password") {
                        print("test")
                    }
                        .customFont(.subheadline2)
                        .opacity(0.5)
                        .foregroundColor(.black.opacity(0.5))
                }
                .padding(.top, 16)
                SecureField("", text: $password)
                    .customTextField("Icon Lock")
            }
            
            Label("Sign in", systemImage: "arrow.right")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.pink.opacity(0.3))
                .foregroundColor(.white)
                .cornerRadius(16)
                .shadow(color: .pink.opacity(0.5), radius: 10, x: 0, y: 3)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(.white.opacity(0.5)))
            
            HStack(alignment: .center, spacing: 12) {
                Rectangle()
                    .frame(width: .infinity, height:1)
                    .opacity(0.1)

                Text("OR")
                    .customFont(.subheadline2)
                    .opacity(0.3)
                
                Rectangle()
                    .frame(width: .infinity, height:1)
                    .opacity(0.1)
            }
            
            Text("Sign up with Google or Apple")
                .customFont(.caption)
                .opacity(0.5)
            
            HStack(alignment: .center, spacing: 40) {
                Image("Logo Apple")
                Image("Logo Google")
            }
            
        }
        .padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 30))
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
        .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 30)
        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black.opacity(0.1)))
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
