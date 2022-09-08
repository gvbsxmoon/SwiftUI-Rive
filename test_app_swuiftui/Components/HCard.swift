//
//  HCard.swift
//  test_app_swuiftui
//
//  Created by Luca Natale on 08/09/22.
//

import SwiftUI

struct HCard: View {
    var course: CourseSection
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 10) {
                Text(course.title)
                    .customFont(.title2)
                Text(course.caption)
                    .customFont(.subheadline)
                    .opacity(0.7)
            }
            .foregroundColor(.white)
            
            Spacer()
            
            Divider()
            
            Spacer()
            
            course.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(.linearGradient(colors: [course.color, course.color.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30))
        .shadow(color: course.color.opacity(0.3), radius: 5, x: 0, y: 6)
    }
}
