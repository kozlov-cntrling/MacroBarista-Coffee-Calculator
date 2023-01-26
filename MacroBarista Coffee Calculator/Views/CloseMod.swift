//
//  CloseMod.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/26/23.
//

import SwiftUI

struct closeMod: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    func body(content: Content) -> some View{
        
        content
            .toolbar{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
            }
    }
}

extension View{
    
    func applyClose() -> some View {
        modifier(closeMod())
    }
}
