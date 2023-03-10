//
//  tabBar.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 2/10/23.
//

import SwiftUI
//TODO: add horizontal swipe functionalities to switch tabs
struct Homepage: View {
    @EnvironmentObject var SessionService: SessionServiceImp

    @State private var showCreateAccount: Bool = false
    @State private var showForgotPassword: Bool = false
    
    @State var current = 2
    init() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], for: .normal)
    }
    var body: some View {
        TabView(selection: $current) {
            Profile_View()
                .tag(1)
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
            }
            Home()
                .tag(2)
                .tabItem {
                    Image(systemName:"plus.circle")
                    Text("Create Recipe")
            }
            SavedRecipes()
                .tag(3)
                .tabItem {
                    Image(systemName:"list.clipboard")
                    Text("Saved Recipes")
            }
        }
        .frame(alignment: .bottom)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

struct tabBar_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
