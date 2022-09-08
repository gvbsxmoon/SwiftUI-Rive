//
//  CustomTextField.swift
//  test_app_swuiftui
//
//  Created by Luca Natale on 05/09/22.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    var icon: String
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.1)))
            .overlay(
                Image(icon)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
            )
    }
}

extension View {
    func customTextField(_ icon: String) -> some View {
        modifier(CustomTextField(icon: icon))
    }
}
