//
//  DropDown.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 2/10/23.
//

import SwiftUI

struct DropDown: View {
    @State public var coffeeSelection = "Latte"
    let coffeeType = ["Cold Brew", "Drip Coffee", "Iced Coffee", "Americano Coffee", "Latte", "Tea"]

        var body: some View {
            VStack {
                Picker("Select a coffee", selection: $coffeeSelection) {
                    ForEach(coffeeType, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)

                Text("Selected coffee: \(coffeeSelection)")
            }
        }
}

struct DropDown_Previews: PreviewProvider {
    static var previews: some View {
        DropDown()
    }
}
