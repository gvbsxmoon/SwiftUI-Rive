//
//  Tab.swift
//  test_app_swuiftui
//
//  Created by Luca Natale on 09/09/22.
//

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
