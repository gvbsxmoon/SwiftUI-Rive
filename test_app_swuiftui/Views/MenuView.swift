//
//  MenuView.swift
//  test_app_swuiftui
//
//  Created by Luca Natale on 09/09/22.
//

import SwiftUI
import RiveRuntime

struct MenuView: View {
    var menuItems: [MenuItem] = []
    var menuItems2: [MenuItem] = []
    @State var selectedMenu: SelectedMenu = .home
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 32) {
                userComponent
                browseComponent
                historyComponent
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: 288, maxHeight: .infinity, alignment: .top)
            .background(Color(hex: "17203A"))
            
            Spacer()
        }
    }
    
    var userComponent: some View {
        HStack(alignment: .center) {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 24, height: 24)
                .padding(8)
                .background(.ultraThinMaterial)
                .mask(Circle())

            VStack(alignment: .leading) {
                Text("Luca Natale")
                    .customFont(.headline)
                Text("UI Designer & Frontender")
                    .customFont(.caption)
                    .opacity(0.7)
            }
        }
    }
    
    var browseComponent: some View {
        VStack {
            Text("Browse")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(0.7)
                .padding([.top, .leading])
            VStack(spacing: 0) {
                ForEach(menuItems) { item in
                    Rectangle()
                        .background(Color.white)
                        .frame(height: 1)
                        .padding(.horizontal)
                        .opacity(0.3)
                    
                    Button {
                        withAnimation(.spring()) {
                            selectedMenu = item.menu
                        }
                        item.icon.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            item.icon.setInput("active", value: false)
                            
                        }
                    } label: {
                        item.icon.view()
                            .frame(width: 24, height: 24)
                        Text(item.text)
                            
                            .customFont(.headline)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 52, alignment: .leading)
                    .background(selectedMenu == item.menu ? Color.accentColor : Color.clear)
                    .mask(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }
    
    var historyComponent: some View {
        VStack {
            Text("History")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(0.7)
                .padding([.top, .leading])
            VStack(spacing: 0) {
                ForEach(menuItems2) { item in
                    Rectangle()
                        .background(Color.white)
                        .frame(height: 1)
                        .padding(.horizontal)
                        .opacity(0.3)
                    
                    Button {
                        withAnimation(.spring()) {
                            selectedMenu = item.menu
                        }
                        
                    } label: {
                        item.icon.view()
                            .frame(width: 24, height: 24)
                        Text(item.text)
                            
                            .customFont(.headline)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 52, alignment: .leading)
                    .background(selectedMenu == item.menu ? Color.accentColor : Color.clear)
                    .mask(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menuItems: menuItems, menuItems2: menuItems2)
    }
}
