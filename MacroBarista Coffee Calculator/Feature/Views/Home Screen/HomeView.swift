//
//  HomeView.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/27/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var SessionService: SessionServiceImp
    var body: some View {
        ZStack{}
        VStack{
            
        }
        Text("Hello ?*")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .environmentObject(SessionServiceImp())
        }
    }
}
