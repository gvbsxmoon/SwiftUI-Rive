//
//  VCard.swift
//  test_app_swuiftui
//
//  Created by Luca Natale on 08/09/22.
//

import SwiftUI

struct VCard: View {
    var course: Course
    
    var body: some View {
        ZStack(alignment: .top) {
            course.image
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(course.title)
                    .customFont(.title2)
                    .frame(maxWidth: 170, alignment: .leading)
                Text(course.subtitle)
                    .customFont(.subheadline)
                    .opacity(0.7)
                Text(course.caption)
                    .customFont(.footnote)
                    .opacity(0.7)
                
                Spacer()
                
                HStack {
                    ForEach(Array([4, 5, 6].shuffled().enumerated()), id: \.offset) { index, number in
                        Image("Avatar \(number)")
                            .resizable()
                            .frame(width: 44, height: 44)
                        .mask(Circle())
                        .offset(x: CGFloat(index * -20))
                    }
                }
            }
            .padding(.vertical, 25)
            .foregroundColor(.white)
        }
        .frame(width: 260, height: 310)
        .background(.linearGradient(colors: [course.color, course.color.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30))
        .shadow(color: course.color.opacity(0.3), radius: 5, x: 0, y: 6)
    }
}
