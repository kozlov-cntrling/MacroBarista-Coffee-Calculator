//
//  TextBoxView.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/24/23.
//

import SwiftUI
import Firebase

struct TextBoxView: View {
    @Binding var text: String
    let placeholder: String
    let keyboard: UIKeyboardType
    let sfSymbol: String?
    
    private let textFieldLeading: CGFloat = 30
    var body: some View {
        TextField(placeholder,text: $text)
            .frame(maxWidth: .infinity, minHeight: 45)
            .padding(.leading,sfSymbol == nil ? textFieldLeading/2: textFieldLeading)
            .keyboardType(keyboard)
            .background(
                ZStack(alignment: .leading){
                    if let systemImage =  sfSymbol{
                        Image(systemName: systemImage)
                            .font(.system(size:16, weight: .semibold))
                            .padding(.leading,5)
                            .foregroundColor(Color.black.opacity(0.2))
                    }
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.black.opacity(1))
                }
            )
    }
}
struct TextBoxView_Previews: PreviewProvider {
    static var previews: some View {
        TextBoxView(text: .constant(""),placeholder: "Email", keyboard: .emailAddress, sfSymbol: "Envelope")
    }
}
