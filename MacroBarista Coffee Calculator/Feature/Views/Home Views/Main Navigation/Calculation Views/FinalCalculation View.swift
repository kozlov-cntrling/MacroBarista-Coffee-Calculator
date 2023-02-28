//
//  FinalCalculation View.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 2/10/23.
//

import SwiftUI

struct FinalCalculation_View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var recipeInfo: RecipeInfo
    
    var body: some View {
        ZStack{
            NavigationView(){
                ZStack(alignment: .topLeading){
                    Image("background")
                        .resizable()
                        .cornerRadius(20)
                        .ignoresSafeArea()
                    Text("Finish your new drink!")
                        .font(.title)
                        .padding(20)
                    VStack(){
                        Text("Your drink is \(recipeInfo.selectedBaseDrinkType.rawValue)")
                        if recipeInfo.selectedBaseDrinkType == .Espresso{
                            Text("Your espresso size is \(recipeInfo.selectedDrinkSizeEspresso.rawValue)")
                    }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.black)
                        .bold()
                }
            })
        }
    }
}
