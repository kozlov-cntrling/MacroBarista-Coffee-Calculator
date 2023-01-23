//
//  CreateAccount View.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/22/23.
//

import SwiftUI
import Firebase

struct CreateAccount_View: View {
    @State public var fname = ""
    @State public var lname = ""
    @State public var password = ""
    @State private var conf_Password = ""
    @State public var email = ""
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
                HStack{
                    TextField("First Name", text: $fname)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    TextField("Last Name", text: $lname)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                }
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
