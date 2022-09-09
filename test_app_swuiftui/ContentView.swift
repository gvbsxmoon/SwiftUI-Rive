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
    @AppStorage("showLogin") var showLogin: Bool = false
    
    let menuButton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {
        ZStack {
            MenuView(menuItems: menuItems, menuItems2: menuItems2)
                .background(Color("Background 2"))
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
            
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
            .mask(RoundedRectangle(cornerRadius: 30))
            .rotation3DEffect(isOpen ? .degrees(-30) : .degrees(0), axis: (x: 0, y: 1, z: 0))
            .scaleEffect(isOpen ? 0.9 : 1)
            .offset(x: isOpen ? 230 : 0)
            .ignoresSafeArea()
            
            menuButtonView
                .offset(x: isOpen ? 216 : 0, y: isOpen ? -2 : 0)
            
            TabBarView()
                .offset(y: isOpen ? 200 : 0)
                .offset(y: showLogin ? 200 : 0)
            
            Color.black.opacity(showLogin ? 0.3 : 0).ignoresSafeArea()
            
            if showLogin {
                OnboardingView()
                    .background(Color("Background"))
                    .mask(RoundedRectangle(cornerRadius: 30))
                    .transition(.move(edge: .top))
                    .offset(y: -70)
            }
            
                
                
        }
        .background(Color("Background 2"))
    }
    
    var menuButtonView: some View {
        HStack(alignment: .center) {
            menuButton.view()
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                .frame(width: 44, height: 44)
                .onTapGesture {
                    menuButton.setInput("isOpen", value: isOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isOpen.toggle()
                    }
            }
            
            Spacer()
            
            Button {
                withAnimation(.spring()) {
                    showLogin = true
                }
            } label: {
                Image(systemName: "person.fill")
            }
            .foregroundColor(Color.black)
            .frame(width: 36, height: 36)
            .background(Color.white)
            .mask(Circle())
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
            .offset(y: 4)
            .offset(x: isOpen ? 100 : 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
