//
//  PasswordBoxView.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/25/23.
//

import SwiftUI

struct PasswordBoxView: View {
    @Binding var password: String
    let placeholder: String
    let sfSymbol: String?
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        SecureField(placeholder,text: $password)
            .frame(maxWidth: .infinity, minHeight: 45)
            .padding(.leading,sfSymbol == nil ? textFieldLeading/2: textFieldLeading)
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

struct PasswordBoxView_Preview: PreviewProvider {
    static var previews: some View {
        PasswordBoxView(password: .constant(""),placeholder: "Email", sfSymbol: "Envolope")
    }
}

