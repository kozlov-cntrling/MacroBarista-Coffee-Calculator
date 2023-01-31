//
//  Homepage.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/29/23.
//
import Firebase
import SwiftUI

struct Homepage: View {
    @State private var showCreateAccount =  false
    @State private var showForgotPassword =  false
    @EnvironmentObject var SessionService: SessionServiceImp
    
    var body: some View {
        VStack{
            Button("Logout", action: SessionService.logOut)
                .tint(.red)
                .buttonStyle(.bordered)
        }
        .padding(.horizontal,16)
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Homepage()
        }
    }
}
