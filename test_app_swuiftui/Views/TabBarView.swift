//
//  TabBarView.swift
//  test_app_swuiftui
//
//  Created by Luca Natale on 08/09/22.
//

import SwiftUI
import RiveRuntime

struct TabBarView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(tabItems) { item in
                    Button {
                        withAnimation(.spring()) {
                            selectedTab = item.selectedTab
                        }
                        item.icon.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            item.icon.setInput("active", value: false)
                            
                        }
                    } label: {
                        item.icon.view()
                            .frame(height: 32)
                            .opacity(selectedTab == item.selectedTab ? 1 : 0.5)
                            .background(
                                VStack {
                                    Spacer()
                                    RoundedRectangle(cornerRadius: .infinity)
                                        .fill(Color.accentColor)
                                        .frame(width: 6, height: 6)
                                        .offset(y: 6)
                                        .opacity(selectedTab == item.selectedTab ? 1 : 0)
                                }
                            )
                    }
                }
            }
            .padding()
            .background(Color("Background 2").opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 22))
            .overlay(RoundedRectangle(cornerRadius: 22)
                .stroke(.white.opacity(0.3)))
            .shadow(color: Color("Background 2").opacity(0.5), radius: 20, x: 0, y: 6)
            .padding(.horizontal)
        }

    }
}
