//
//  TabBarView.swift
//  test_app_swuiftui
//
//  Created by Luca Natale on 08/09/22.
//

import SwiftUI
import RiveRuntime

enum Tab: String {
    case chat
    case search
    case timer
    case bell
    case user
}

struct TabItems: Identifiable {
    let id = UUID()
    let icon: RiveViewModel
    let selectedTab: Tab
}

let tabItems = [
    TabItems(icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), selectedTab: .chat),
    TabItems(icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), selectedTab: .search),
    TabItems(icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), selectedTab: .timer),
    TabItems(icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), selectedTab: .bell),
    TabItems(icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), selectedTab: .user)
]


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

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
