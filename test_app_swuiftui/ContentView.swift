//
//  ContentView.swift
//  test_app_swuiftui
//
//  Created by Luca Natale on 08/09/22.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    @State var isOpen: Bool = false
    
    let menuButton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {
        ZStack {
            
            Group {
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("test 1")
                case .timer:
                    Text("test 2")
                case .bell:
                    Text("test 3")
                case .user:
                    Text("test 4")
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 104)
            }
            .ignoresSafeArea()
            
            menuButtonView
            
            TabBarView()
        }
        .background(Color("Background").ignoresSafeArea())
    }
    
    var menuButtonView: some View {
        ZStack {
            menuButton.view()
                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 4)
                .frame(width: 44, height: 44)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .onTapGesture {
                    menuButton.setInput("isOpen", value: isOpen)
                    isOpen.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
