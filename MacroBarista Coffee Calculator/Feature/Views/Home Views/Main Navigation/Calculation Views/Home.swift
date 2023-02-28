//TODO: add padding to the entire app
//TODO: add different cup sizings visuals

import Firebase
import SwiftUI

struct Home: View {
    //TODO: put all enums/variables into a different struct and call from it like a viewmodel
    @ObservedObject public var recipeInfo = RecipeInfo()
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("background")
                    .resizable()
                    .cornerRadius(20)
                    .ignoresSafeArea()
                
                VStack(){
                    
                    Spacer().frame(height:15)
                    Text("What're you drinking?")
                        .fontWeight(.light)
                        .font(.title)
                        .padding()
                    HStack(alignment: .center,spacing:15){
                        Button{
                            recipeInfo.selectedBaseDrinkType = RecipeInfo.baseDrinkType.Frappuicino
                            //TODO: finish calorie counterz
                            if recipeInfo.selectedBaseDrinkType == .Frappuicino {
                                recipeInfo.Calories += 0
                            } else {
                                recipeInfo.Calories -= 0
                            }
                            
                        } label: {
                            if recipeInfo.selectedBaseDrinkType != RecipeInfo.baseDrinkType.Frappuicino {
                                VStack{
                                    Image("coffee")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 80)
                                        .clipShape(Circle())
                                    Text("Frappuicino")
                                }
                            }; if recipeInfo.selectedBaseDrinkType == RecipeInfo.baseDrinkType.Frappuicino  {
                                ImgButtonView(title: "Frappuicino", image: "coffee", width: 100) {
                                }
                            }
                        }
                        
                        Button{
                            recipeInfo.selectedBaseDrinkType = .Espresso
                            
                            if recipeInfo.selectedBaseDrinkType == .Espresso {
                                recipeInfo.Calories += 0
                            } else {
                                recipeInfo.Calories -= 0
                            }
                            
                        } label: {
                            if recipeInfo.selectedBaseDrinkType != .Espresso {
                                VStack{
                                    Image("coffee")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 80)
                                        .clipShape(Circle())
                                    Text("Espresso")
                                }
                            } else {
                                ImgButtonView(title: "Espresso", image: "coffee", width: 100) {
                                }
                            }
                        }
                        Button{
                            recipeInfo.selectedBaseDrinkType = RecipeInfo.baseDrinkType.Coffee
                            
                            if recipeInfo.selectedBaseDrinkType == RecipeInfo.baseDrinkType.Coffee {
                                recipeInfo.Calories += 0
                            } else {
                                recipeInfo.Calories -= 0
                            }
                            
                        } label: {
                            if recipeInfo.selectedBaseDrinkType != RecipeInfo.baseDrinkType.Coffee {
                                VStack{
                                    Image("coffee")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 80)
                                        .clipShape(Circle())
                                    Text("Coffee/Tea")
                                }
                            } else {
                                ImgButtonView(title: "Coffee/Tea", image: "coffee", width: 100) {
                                }
                            }
                        }
                        //REFRESHER OPTION
                        Button{
                            recipeInfo.selectedBaseDrinkType = .Refresher
                            
                            if recipeInfo.selectedBaseDrinkType == .Refresher {
                                recipeInfo.Calories += 0
                            } else {
                                recipeInfo.Calories -= 0
                            }
                            
                        } label: {
                            if recipeInfo.selectedBaseDrinkType != .Refresher{
                                VStack{
                                    Image("coffee")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 80)
                                        .clipShape(Circle())
                                    Text("Refresher")
                                }
                            } else {
                                ImgButtonView(title: "Refresher", image: "coffee", width: 100) {
                                }
                            }
                        }
                    }
                    //COFFEE ACTIVE
                    if recipeInfo.selectedBaseDrinkType == .Coffee{
                        VStack {
                            Text("Coffee brew?")
                                .fontWeight(.light)
                                .font(.title)
                            Picker("Select a brew", selection: $recipeInfo.coffeeSelection) {
                                ForEach(recipeInfo.coffeeType, id: \.self) {
                                    Text($0)
                                        .foregroundColor(.blue)
                                }
                            }
                            .pickerStyle(.menu)
                            
                            NavigationLink(destination: FinalCalculation_View(recipeInfo: recipeInfo)) {
                                HStack{
                                    NavigationButtonView(title: "Next", sfSymbol: "arrowshape.turn.up.right", width: 100)
                                }
                            }
                        }
                        .padding(25)
                    }
                    //ESPRESSO ACTIVE
                    if recipeInfo.selectedBaseDrinkType == .Espresso   {
                        VStack{
                            Text("Drink size?")
                                .fontWeight(.light)
                                .font(.title)
                                .padding()
                            HStack(alignment: .center,spacing:15){
                                Button{
                                    recipeInfo.selectedDrinkSizeEspresso = .Venti
                                    //TODO: finish calorie counter
                                    if recipeInfo.selectedDrinkSizeEspresso == .Venti {
                                        recipeInfo.Calories += 0
                                    } else {
                                        recipeInfo.Calories -= 0
                                    }
                                    
                                } label: {
                                    if recipeInfo.selectedDrinkSizeEspresso != .Venti {
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 102)
                                                .clipShape(Circle())
                                            Text("Venti")
                                        }
                                    } else {
                                        ImgButtonView(title: "Venti", image: "coffee", width: 100) {
                                        }
                                    }
                                }
                                Button{
                                    recipeInfo.selectedDrinkSizeEspresso = .Grande
                                    //TODO: finish calorie counter
                                    if recipeInfo.selectedDrinkSizeEspresso == .Grande {
                                        recipeInfo.Calories += 0
                                    } else {
                                        recipeInfo.Calories -= 0
                                    }
                                    
                                } label: {
                                    if recipeInfo.selectedDrinkSizeEspresso != .Grande {
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 90)
                                                .clipShape(Circle())
                                            Text("Grande")
                                        }
                                    } else {
                                        ImgButtonView(title: "Grande", image: "coffee", width: 90) {
                                        }
                                    }
                                }
                                Button{
                                    recipeInfo.selectedDrinkSizeEspresso = .Tall
                                    //TODO: finish calorie counter
                                    if recipeInfo.selectedDrinkSizeEspresso == .Tall {
                                        recipeInfo.Calories += 0
                                    } else {
                                        recipeInfo.Calories -= 0
                                    }
                                    
                                } label: {
                                    if recipeInfo.selectedDrinkSizeEspresso != .Tall {
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 90)
                                                .clipShape(Circle())
                                            Text("Tall")
                                        }
                                    } else {
                                        ImgButtonView(title: "Tall", image: "coffee", width: 90) {
                                        }
                                    }
                                }
                                Button{
                                    recipeInfo.selectedDrinkSizeEspresso = .Short
                                    //TODO: finish calorie counter
                                    if recipeInfo.selectedDrinkSizeEspresso == .Short {
                                        recipeInfo.Calories += 0
                                    } else {
                                        recipeInfo.Calories -= 0
                                    }
                                    
                                } label: {
                                    if recipeInfo.selectedDrinkSizeEspresso != .Short {
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 90)
                                                .clipShape(Circle())
                                            Text("Short")
                                        }
                                    } else {
                                        ImgButtonView(title: "Short", image: "coffee", width: 90) {
                                        }
                                    }
                                }
                            }
                            if recipeInfo.selectedBaseDrinkType == .Espresso{
                                if recipeInfo.selectedDrinkSizeEspresso != .none{
                                    NavigationLink(destination: FinalCalculation_View(recipeInfo: recipeInfo)) {
                                        HStack{
                                            NavigationButtonView(title: "Next", sfSymbol: "arrowshape.turn.up.right", width: 100)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    //FRAPP ACTIVE
                    if recipeInfo.selectedBaseDrinkType == .Frappuicino    {
                        VStack{
                            Text("Drink size?")
                                .fontWeight(.light)
                                .font(.title)
                                .padding()
                            HStack(alignment: .center,spacing:15){
                                Button{
                                    recipeInfo.selectedDrinkSizeFrapp = .Venti
                                    //TODO: finish calorie counter
                                    if recipeInfo.selectedDrinkSizeFrapp == .Venti {
                                        recipeInfo.Calories += 0
                                    } else {
                                        recipeInfo.Calories -= 0
                                    }
                                    
                                } label: {
                                    if recipeInfo.selectedDrinkSizeFrapp != .Venti {
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 98)
                                                .clipShape(Circle())
                                            Text("Venti")
                                        }
                                    } else {
                                        ImgButtonView(title: "Venti", image: "coffee", width: 98) {
                                        }
                                    }
                                }
                                Button{
                                    recipeInfo.selectedDrinkSizeFrapp = .Grande
                                    //TODO: finish calorie counter
                                    if recipeInfo.selectedDrinkSizeFrapp == .Grande {
                                        recipeInfo.Calories += 0
                                    } else {
                                        recipeInfo.Calories -= 0
                                    }

                                } label: {
                                    if recipeInfo.selectedDrinkSizeFrapp != .Grande {
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 90)
                                                .clipShape(Circle())
                                            Text("Grande")
                                        }
                                    } else {
                                        ImgButtonView(title: "Grande", image: "coffee", width: 90) {
                                        }
                                    }
                                }
                                Button{
                                    recipeInfo.selectedDrinkSizeFrapp = .Tall
                                    //TODO: finish calorie counter
                                    if recipeInfo.selectedDrinkSizeFrapp == .Tall {
                                        recipeInfo.Calories += 0
                                    } else {
                                        recipeInfo.Calories -= 0
                                    }
                                } label: {
                                    if recipeInfo.selectedDrinkSizeFrapp != .Tall{
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 80)
                                                .clipShape(Circle())
                                            Text("Tall")
                                        }
                                    } else {
                                        ImgButtonView(title: "Tall", image: "coffee", width: 80) {
                                        }
                                    }
                                }
                            }
                            if recipeInfo.selectedBaseDrinkType != RecipeInfo.baseDrinkType.none{
                                if recipeInfo.selectedDrinkSizeFrapp != RecipeInfo.drinkSizeFrapp.none{
                                    NavigationLink(destination: FinalCalculation_View(recipeInfo: recipeInfo)) {
                                        HStack{
                                            NavigationButtonView(title: "Next", sfSymbol: "arrowshape.turn.up.right", width: 100)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    //REFRESHER ACTIVE
                    //TODO: fix bug where drink size stays active
                    if recipeInfo.selectedBaseDrinkType == .Refresher  {
                        VStack(spacing: 0){
                            Text("Drink size?")
                                .fontWeight(.light)
                                .font(.title)
                                .padding()
                            HStack(alignment: .center,spacing:15){
                                //Tentra
                                Button{
                                    recipeInfo.selectedDrinkSize = .Trenta
                                    //TODO: finish calorie counter
                                    if recipeInfo.selectedDrinkSize == .Trenta {
                                        recipeInfo.Calories += 0
                                    } else {
                                        recipeInfo.Calories -= 0
                                    }
                                    
                                } label: {
                                    if recipeInfo.selectedDrinkSize != .Trenta {
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 103)
                                                .clipShape(Circle())
                                            Text("Trenta")
                                        }
                                    } else {
                                        ImgButtonView(title: "Trenta", image: "coffee", width: 103) {
                                        }
                                    }
                                }
                                //Venti
                                Button{
                                    recipeInfo.selectedDrinkSize = .Venti
                                    //TODO: finish calorie counter
                                    if recipeInfo.selectedDrinkSize == .Venti {
                                        recipeInfo.Calories += 0
                                    } else {
                                        recipeInfo.Calories -= 0
                                    }
                                    
                                } label: {
                                    if recipeInfo.selectedDrinkSize != .Venti {
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 98)
                                                .clipShape(Circle())
                                            Text("Venti")
                                        }
                                    } else {
                                        ImgButtonView(title: "Venti", image: "coffee", width: 98) {
                                        }
                                    }
                                }
                                //Grande
                                Button{
                                    recipeInfo.selectedDrinkSize = .Grande
                                    //TODO: finish calorie counter
                                    if recipeInfo.selectedDrinkSize == .Grande {
                                        recipeInfo.Calories += 0
                                    } else {
                                        recipeInfo.Calories -= 0
                                    }
                                    
                                } label: {
                                    if recipeInfo.selectedDrinkSize != .Grande {
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 90)
                                                .clipShape(Circle())
                                            Text("Grande")
                                        }
                                    } else {
                                        ImgButtonView(title: "Grande", image: "coffee", width: 90) {
                                        }
                                    }
                                }
                                //Tall
                                Button{
                                    recipeInfo.selectedDrinkSize = .Tall
                                    //TODO: finish calorie counter
                                    if recipeInfo.selectedDrinkSize == .Tall {
                                        recipeInfo.Calories += 0
                                    } else {
                                        recipeInfo.Calories -= 0
                                    }
                                } label: {
                                    if recipeInfo.selectedDrinkSize != .Tall{
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 80)
                                                .clipShape(Circle())
                                            Text("Tall")
                                        }
                                    } else {
                                        ImgButtonView(title: "Tall", image: "coffee", width: 80) {
                                        }
                                    }
                                }
                            }
                            
                            if recipeInfo.selectedBaseDrinkType != RecipeInfo.baseDrinkType.none{
                                if recipeInfo.selectedDrinkSize != RecipeInfo.drinkSizeRefresher.none{
                                    VStack{
                                        Text("Ice amount?")
                                            .fontWeight(.light)
                                            .font(.title)
                                            .padding()
                                        HStack(alignment: .center,spacing:15){
                                            //extra ice
                                            Button{
                                                recipeInfo.selectedDrinkIceAmount = .Extra
                                                
                                                if recipeInfo.selectedDrinkIceAmount == .Extra {
                                                    recipeInfo.Calories += 0
                                                } else {
                                                    recipeInfo.Calories -= 0
                                                }
                                            } label: {
                                                if (recipeInfo.selectedDrinkIceAmount != .Extra){
                                                    VStack{
                                                        Image("coffee")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(maxWidth: 98)
                                                            .clipShape(Circle())
                                                        Text("Extra")
                                                    }
                                                } else {
                                                    VStack{
                                                        Image("coffee")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(maxWidth: 98)
                                                            .clipShape(Circle())
                                                            .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                                        Text("Extra")
                                                    }
                                                }
                                            }
                                            Button{
                                                recipeInfo.selectedDrinkIceAmount = .Regular
                                                
                                                if recipeInfo.selectedDrinkIceAmount == .Regular {
                                                    recipeInfo.Calories += 0
                                                } else {
                                                    recipeInfo.Calories -= 0
                                                }
                                            } label: {
                                                if (recipeInfo.selectedDrinkIceAmount != .Regular){
                                                    VStack{
                                                        Image("coffee")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(maxWidth: 98)
                                                            .clipShape(Circle())
                                                        Text("Regular")
                                                    }
                                                } else {
                                                    VStack{
                                                        Image("coffee")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(maxWidth: 98)
                                                            .clipShape(Circle())
                                                            .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                                        Text("Regular")
                                                    }
                                                }
                                            }
                                            Button{
                                                recipeInfo.selectedDrinkIceAmount = .Light
                                                
                                                if recipeInfo.selectedDrinkIceAmount == .Light {
                                                    recipeInfo.Calories += 0
                                                } else {
                                                    recipeInfo.Calories -= 0
                                                }
                                            } label: {
                                                if (recipeInfo.selectedDrinkIceAmount != .Light){
                                                    VStack{
                                                        Image("coffee")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(maxWidth: 98)
                                                            .clipShape(Circle())
                                                        Text("Light")
                                                    }
                                                } else {
                                                    VStack{
                                                        Image("coffee")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(maxWidth: 98)
                                                            .clipShape(Circle())
                                                            .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                                        Text("Light")
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            } 
                        }
                    }
                    if recipeInfo.selectedBaseDrinkType == .Refresher{
                        if recipeInfo.selectedDrinkSize != .none{
                            NavigationLink(destination: FinalCalculation_View(recipeInfo: recipeInfo)) {
                                HStack{
                                    NavigationButtonView(title: "Next", sfSymbol: "arrowshape.turn.up.right", width: 100)
                                }
                            }
                        }
                    }
                }
                .frame(minWidth: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(5)
            }
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
