//
//  CreateAccount View.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/22/23.
//

import SwiftUI

struct CreateAccount_View: View {
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .cornerRadius(20)
                .ignoresSafeArea()
            VStack(alignment:.leading, spacing: 15){
                Text("**Create an account**")
                    .foregroundColor(.white)
                    .font(.system(size:36, weight:.medium, design:.rounded))
                HStack(spacing:5){
                    Button("Already have one?", action:{})
                        .foregroundColor(.white)
                        .font(.system(size:15, weight:.medium, design:.rounded))
                    Button("Sign in", action:{})
                        .font(.system(size:15, weight:.medium, design:.rounded))
                    Spacer()
                }
            }
        }
    }
}
    
    
    
    
    struct CreateAccount_View_Previews: PreviewProvider {
        static var previews: some View {
            CreateAccount_View()
        }
    }
