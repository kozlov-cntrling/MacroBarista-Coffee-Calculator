//
//  FinalCalculation View.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 2/10/23.
//

import SwiftUI

struct FinalCalculation_View: View {
    @StateObject public var vm = CreateRecipeVMImp(
        state: FetchRecipeState)
    var body: some View {
        ZStack{
            NavigationView(){
                Image("background")
                    .resizable()
                    .cornerRadius(20)
                    .ignoresSafeArea()
            }
            .navigationTitle("")
        }
    }
}

struct FinalCalculation_View_Previews: PreviewProvider {
    static var previews: some View {
        FinalCalculation_View()
    }
}
