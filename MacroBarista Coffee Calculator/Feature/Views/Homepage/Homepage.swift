//TODO: add padding to the entire app
//TODO: add different cup sizings visuals
//TODO:
import Firebase
import SwiftUI

enum Screen{
    case savedRecipes
    case calculator
}
struct Homepage: View {
    @State private var showCreateAccount: Bool = false
    @State private var showForgotPassword: Bool = false
    
    @State private var selectedDrinkIceAmount: drinkIceAmount?
    @State private var selectedBaseDrinkType: baseDrinkType?
    
    @State public var selectedDrinkSize: drinkSizeRefresher?
    
    @EnvironmentObject var SessionService: SessionServiceImp
    
    @State public var Calories: Int = 0

    public enum baseDrinkType: String{
        case Frappuicino = "frappuicino"
        case Espresso = "espresso"
        case Coffee = "coffee"
        case Refresher = "refresher"
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
        ZStack{
            Image("background")
                .resizable()
                .cornerRadius(20)
                .ignoresSafeArea()
            HStack(){
                Button("Logout", action: SessionService.logOut)
                                .tint(.red)
                                .buttonStyle(.bordered)
                Spacer()
                
                VStack(){
                    Button("Saved Recipes", action:{
                        
                    })
                    .fontWeight(.medium)
                    .font(.headline)
                    Spacer()
                }
                .padding(.trailing, 20)
            }
            
            VStack(){
                Spacer().frame(height:60)
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
                
                //REFRESHER
                //TODO: fix bug where drink size stays active
                if selectedBaseDrinkType == .Refresher{
                    VStack(){
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
                                    ZStack(alignment: .bottomTrailing){
                                        ButtonView(title: "Next", sfSymbol: "arrowshape.turn.up.right") {
                                            //TODO: add navigation to new view
                                        }
                                    }
                                    ZStack(alignment: .bottom){
                                        TabView {
                                                Homepage()
                                                    .tabItem {
                                                        Label("Menu", systemImage: "plus.circle")
                                                    }

                                                SavedRecipes()
                                                    .tabItem {
                                                        Label("Saved Recipes", systemImage: "list.clipboard")
                                                    }
                                            }
                                            .toolbarBackground(.hidden, for: .navigationBar)
                                    }
                                    }
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
struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Homepage()
        }
    }
}

