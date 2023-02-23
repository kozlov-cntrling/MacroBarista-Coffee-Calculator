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

protocol FetchRecipe {
    var calories: Int {get}
    var selectedBaseDrinkType: String {get}
    var selectedDrinkIceAmount: String {get}
    var selectedDrinkSizeFrapp: String {get}
    var selectedDrinkSize: String {get}
    
    var state:FetchRecipeState {get}
    
    var hasError: Bool {get}
    
}

enum SaveRecipeState {
    case success
    case fail(error:Error)
    case NA
}

//TODO: create returns based on string values and selections
final class CreateRecipeVMImp: ObservableObject, FetchRecipe{
    var state: FetchRecipeState
    
    init(state: FetchRecipeState) {
        self.state = state
    }
    
    var calories: Int = 0
    
    var selectedBaseDrinkType: String = ""
    
    var selectedDrinkIceAmount: String = ""
    
    var selectedDrinkSizeFrapp: String = ""
    
    var selectedDrinkSize: String = ""
    
    @Published var hasError: Bool = false
    func FetchRecipe(){
        
    }
}
