//
//  Homepage.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/29/23.
//
import Firebase
import SwiftUI
enum baseDrinkType{
    case Frappuicino, Espresso, Coffee, Refresher
}
struct Homepage: View {
    @State private var showCreateAccount: Bool = false
    @State private var showForgotPassword: Bool = false
    
    @State private var selectedBaseDrinkType: baseDrinkType
    @State var answer: baseDrinkType
    @EnvironmentObject var SessionService: SessionServiceImp
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .cornerRadius(20)
                .ignoresSafeArea()
            VStack(){
                HStack(){
                    Spacer().frame(width: 60)
                    Button("My Recipes", action:{
                        
                    })
                    .fontWeight(.medium)
                    .font(.headline)
                }
                Spacer().frame(height:60)
                Text("What're you drinking?")
                    .fontWeight(.light)
                    .font(.title)
                    .padding()
                HStack(alignment: .center,spacing:15){
                    Button{
                        selectedBaseDrinkType = .Frappuicino
                        //TODO: Add shadow toggle when user selects option
                    } label: {
                        VStack{
                        Image("coffee")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                            .clipShape(Circle())
                            .shadow(color: .gray, radius: 20, x: 0, y: 2)
                            Text("Frappuicino")
                        }
                    }
                    Button{
                        selectedBaseDrinkType = .Espresso
                        //TODO: Add shadow toggle when user selects option
                    } label: {
                        VStack{
                        Image("coffee")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                            .clipShape(Circle())
                            Text("Espresso")
                        }
                    }
                    Button{
                        selectedBaseDrinkType = .Coffee
                        //TODO: Add shadow toggle when user selects option
                    } label: {
                        VStack{
                        Image("coffee")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                            .clipShape(Circle())
                            Text("Coffee/Tea")
                        }
                    }
                    Button{
                        selectedBaseDrinkType = .Refresher
                        //TODO: Add shadow toggle when user selects option
                    } label: {
                        VStack{
                        Image("coffee")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                            .clipShape(Circle())
                            Text("Refresher")
                        }
                    }
                }
            }
            .frame(minWidth: 0, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }
    
struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Homepage()
        }
    }
}

