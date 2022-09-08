//
//  HomeView.swift
//  test_app_swuiftui
//
//  Created by Luca Natale on 08/09/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                vContent
                
                hContent
            }
        }
        
    }
    
    var vContent: some View {
        VStack(spacing: 15) {
            Text("Courses")
                .customFont(.largeTitle)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(courses) { item in
                        VCard(course: item)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
    
    var hContent: some View {
        VStack(spacing: 15) {
            Text("Recent")
                .customFont(.title2)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    ForEach(courseSections) { item in
                        HCard(course: item)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
