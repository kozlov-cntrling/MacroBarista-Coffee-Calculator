//
//  FinalCalculationVM.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 2/12/23.
//

import SwiftUI

enum FetchRecipeState {
    case success
    case fail(error:Error)
    case NA
}

class RecipeInfo: ObservableObject{
    public enum baseDrinkType: String{
        case Frappuicino
        case Espresso
        case Coffee
        case Refresher
        case none
    }
    public enum drinkSizeRefresher: String{
        case Venti
        case Grande
        case Tall
        case Trenta
        case Short
        case none
    }
    public enum drinkSizeFrapp: String{
        case Venti
        case Grande
        case Tall
        case none
    }
    public enum drinkSizeEspresso: String{
        case Venti
        case Grande
        case Tall
        case Short
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

    @Published var selectedDrinkIceAmount: drinkIceAmount  = .none
    @Published var selectedBaseDrinkType: baseDrinkType  = .none
    
    @Published public var selectedDrinkSize: drinkSizeRefresher = .none
    @Published public var selectedDrinkSizeFrapp: drinkSizeFrapp = .none
    @Published public var selectedDrinkSizeEspresso: drinkSizeEspresso = .none
    
    @Published public var Calories: Int = 0
    @Published public var Caffeine: Int = 0
    
    @Published public var coffeeSelection = "Latte"
    
    let coffeeType = ["Cold Brew", "Drip Coffee", "Iced Coffee", "Americano Coffee", "Latte", "Tea"]
}
