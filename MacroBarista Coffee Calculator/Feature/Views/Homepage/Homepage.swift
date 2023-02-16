//TODO: add padding to the entire app
//TODO: add different cup sizings visuals

import Firebase
import SwiftUI

enum Screen{
    case savedRecipes
    case calculator
}
struct Homepage: View {
    @State private var showCreateAccount: Bool = false
    @State private var showForgotPassword: Bool = false
    
    @State var selectedDrinkIceAmount: drinkIceAmount?  = Optional.none
    @State var selectedBaseDrinkType: baseDrinkType?  = Optional.none
    
    @State var selectedDrinkSize: drinkSizeRefresher? = Optional.none
    @State var selectedDrinkSizeFrapp: drinkSizeFrapp? = Optional.none
    
    @EnvironmentObject var SessionService: SessionServiceImp
    
    @State public var Calories: Int = 0
    
    @State private var coffeeSelection = "Latte"
    
    let coffeeType = ["Cold Brew", "Drip Coffee", "Iced Coffee", "Americano Coffee", "Latte", "Tea"]
    
    public enum baseDrinkType: String{
        case Frappuicino = "Frappuicino"
        case Espresso = "Espresso"
        case Coffee = "Coffee"
        case Refresher = "Refresher"
        case none 
    }
    public enum drinkSizeRefresher: String{
        case Venti = "venti"
        case Grande = "grande"
        case Tall = "tall"
        case Trenta = "trenta"
        case Short = "short"
        case none
    }
    public enum drinkSizeFrapp: String{
        case Venti = "venti"
        case Grande = "grande"
        case Tall = "tall"
        case none
    }
    public enum drinkTemp{
        case Hot
        case Cold
    }
    public enum drinkIceAmount{
        case none
        case Light
        case Extra
        case Regular
    }
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
                            selectedBaseDrinkType = .Frappuicino
                            //TODO: finish calorie counter
                            if selectedBaseDrinkType == .Frappuicino {
                                Calories += 0
                            } else {
                                Calories -= 0
                            }
                            
                        } label: {
                            if selectedBaseDrinkType != .Frappuicino {
                                VStack{
                                    Image("coffee")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 80)
                                        .clipShape(Circle())
                                    Text("Frappuicino")
                                }
                            } else {
                                VStack{
                                    Image("coffee")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 100)
                                        .clipShape(Circle())
                                        .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                    Text("Frappuicino")
                                }
                            }
                        }
                        
                        Button{
                            selectedBaseDrinkType = .Espresso
                            
                            if selectedBaseDrinkType == .Espresso {
                                Calories += 0
                            } else {
                                Calories -= 0
                            }
                            
                        } label: {
                            if selectedBaseDrinkType != .Espresso {
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
                                VStack{
                                    Image("coffee")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 100)
                                        .clipShape(Circle())
                                        .shadow(color: .purple, radius: 20, x: 0, y: 2)
                                    Text("Espresso")
                                }
                            }
                        }
                        Button{
                            selectedBaseDrinkType = .Coffee
                            
                            if selectedBaseDrinkType == .Coffee {
                                Calories += 0
                            } else {
                                Calories -= 0
                            }
                            
                        } label: {
                            if selectedBaseDrinkType != .Coffee {
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
                                VStack{
                                    Image("coffee")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 100)
                                        .clipShape(Circle())
                                        .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                    Text("Coffee/Tea")
                                }
                            }
                        }
                        //REFRESHER OPTION
                        Button{
                            selectedBaseDrinkType = .Refresher
                            
                            if selectedBaseDrinkType == .Refresher {
                                Calories += 0
                            } else {
                                Calories -= 0
                            }
                            
                        } label: {
                            if selectedBaseDrinkType != .Refresher{
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
                                VStack{
                                    Image("coffee")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 100)
                                        .clipShape(Circle())
                                        .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                    Text("Refresher")
                                }
                            }
                        }
                    }
                    //COFFEE ACTIVE
                    if selectedBaseDrinkType == .Coffee{
                        VStack {
                            Text("Coffee brew?")
                                .fontWeight(.light)
                                .font(.title)
                            Picker("Select a brew", selection: $coffeeSelection) {
                                ForEach(coffeeType, id: \.self) {
                                    Text($0)
                                        .foregroundColor(.blue)
                                }
                            }
                            .pickerStyle(.inline)
                            
                            Text("Selected coffee: \(coffeeSelection)")
                        }
                        .padding(30)
                    }
                    //ESPRESSO ACTIVE
                    if selectedBaseDrinkType == .Espresso   {
                        VStack{
                            Text("Drink size?")
                                .fontWeight(.light)
                                .font(.title)
                                .padding()
                            HStack(alignment: .center,spacing:15){
                                
                            }
                        }
                    }
                    //FRAPP ACTIVE
                    if selectedBaseDrinkType == .Frappuicino    {
                        VStack{
                            Text("Drink size?")
                                .fontWeight(.light)
                                .font(.title)
                                .padding()
                            HStack(alignment: .center,spacing:15){
                                
                                Button{
                                    selectedDrinkSizeFrapp = .Tall
                                    //TODO: finish calorie counter
                                    if selectedDrinkSizeFrapp == .Tall {
                                        Calories += 0
                                    } else {
                                        Calories -= 0
                                    }
                                } label: {
                                    if selectedDrinkSizeFrapp != .Tall{
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
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 80)
                                                .clipShape(Circle())
                                                .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                            Text("Tall")
                                        }
                                    }
                                }
                                Button{
                                    selectedDrinkSizeFrapp = .Grande
                                    //TODO: finish calorie counter
                                    if selectedDrinkSizeFrapp == .Grande {
                                        Calories += 0
                                    } else {
                                        Calories -= 0
                                    }
                                    
                                } label: {
                                    if selectedDrinkSizeFrapp != .Grande {
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
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 90)
                                                .clipShape(Circle())
                                                .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                            Text("Grande")
                                        }
                                    }
                                }
                                Button{
                                    selectedDrinkSizeFrapp = .Venti
                                    //TODO: finish calorie counter
                                    if selectedDrinkSizeFrapp == .Venti {
                                        Calories += 0
                                    } else {
                                        Calories -= 0
                                    }
                                    
                                } label: {
                                    if selectedDrinkSizeFrapp != .Venti {
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
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 98)
                                                .clipShape(Circle())
                                                .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                            Text("Venti")
                                            
                                        }
                                    }
                                }
                                if selectedBaseDrinkType != Homepage.baseDrinkType.none{
                                    if selectedDrinkSizeFrapp != Homepage.drinkSizeFrapp.none{
                                        
                                    }
                                }
                            }
                        }
                    }
                    //REFRESHER ACTIVE
                    //TODO: fix bug where drink size stays active
                    if selectedBaseDrinkType == .Refresher  {
                        VStack(spacing: 0){
                            Text("Drink size?")
                                .fontWeight(.light)
                                .font(.title)
                                .padding()
                            HStack(alignment: .center,spacing:15){
                                //Tentra
                                Button{
                                    selectedDrinkSize = .Trenta
                                    //TODO: finish calorie counter
                                    if selectedDrinkSize == .Trenta {
                                        Calories += 0
                                    } else {
                                        Calories -= 0
                                    }
                                    
                                } label: {
                                    if selectedDrinkSize != .Trenta {
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
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 103)
                                                .clipShape(Circle())
                                                .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                            Text("Trenta")
                                        }
                                    }
                                }
                                //Venti
                                Button{
                                    selectedDrinkSize = .Venti
                                    //TODO: finish calorie counter
                                    if selectedDrinkSize == .Venti {
                                        Calories += 0
                                    } else {
                                        Calories -= 0
                                    }
                                    
                                } label: {
                                    if selectedDrinkSize != .Venti {
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
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 98)
                                                .clipShape(Circle())
                                                .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                            Text("Venti")
                                            
                                        }
                                    }
                                }
                                //Grande
                                Button{
                                    selectedDrinkSize = .Grande
                                    //TODO: finish calorie counter
                                    if selectedDrinkSize == .Grande {
                                        Calories += 0
                                    } else {
                                        Calories -= 0
                                    }
                                    
                                } label: {
                                    if selectedDrinkSize != .Grande {
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
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 90)
                                                .clipShape(Circle())
                                                .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                            Text("Grande")
                                        }
                                    }
                                }
                                //Tall
                                Button{
                                    selectedDrinkSize = .Tall
                                    //TODO: finish calorie counter
                                    if selectedDrinkSize == .Tall {
                                        Calories += 0
                                    } else {
                                        Calories -= 0
                                    }
                                } label: {
                                    if selectedDrinkSize != .Tall{
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
                                        VStack{
                                            Image("coffee")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 80)
                                                .clipShape(Circle())
                                                .shadow(color: .purple, radius: 50, x: 0, y: 2)
                                            Text("Tall")
                                        }
                                    }
                                }
                            }
                            
                            if selectedBaseDrinkType != Homepage.baseDrinkType.none{
                                if selectedDrinkSize != Homepage.drinkSizeRefresher.none{
                                    VStack{
                                        Text("Ice amount?")
                                            .fontWeight(.light)
                                            .font(.title)
                                            .padding()
                                        HStack(alignment: .center,spacing:15){
                                            //extra ice
                                            Button{
                                                selectedDrinkIceAmount = .Extra
                                                
                                                if selectedDrinkIceAmount == .Extra {
                                                    Calories += 0
                                                } else {
                                                    Calories -= 0
                                                }
                                            } label: {
                                                if (selectedDrinkIceAmount != .Extra){
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
                                                selectedDrinkIceAmount = .Regular
                                                
                                                if selectedDrinkIceAmount == .Regular {
                                                    Calories += 0
                                                } else {
                                                    Calories -= 0
                                                }
                                            } label: {
                                                if (selectedDrinkIceAmount != .Regular){
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
                                                selectedDrinkIceAmount = .Light
                                                
                                                if selectedDrinkIceAmount == .Light {
                                                    Calories += 0
                                                } else {
                                                    Calories -= 0
                                                }
                                            } label: {
                                                if (selectedDrinkIceAmount != .Light){
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
                    //Next button APPEARS when refresher is selected
                    if selectedDrinkSize != Optional.none{
                        if selectedBaseDrinkType == .Refresher{
                            NavigationLink(destination: FinalCalculation_View()){
                                HStack{
                                    Spacer()
                                    ButtonView(title: "Next", sfSymbol: "arrowshape.turn.up.right", width: 40) {
                                    }
                                }
                            }
                        } else {
                            
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

