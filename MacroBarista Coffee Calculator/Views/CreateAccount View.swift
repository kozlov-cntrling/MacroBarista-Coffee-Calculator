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
    @State public var username = ""
    @State public var password = ""
    @State public var email = ""
    var body: some View {
        NavigationView {
            ZStack{
                Image("background")
                    .resizable()
                    .cornerRadius(20)
                    .ignoresSafeArea()
                VStack(alignment: .center,spacing: 16){
                    Text("**Create an account**")
                        .foregroundColor(.white)
                        .font(.system(size:36, weight:.medium, design:.rounded))
                    HStack(){
                        TextField("First Name", text: $fname)
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.never)
                        TextField("Last Name", text: $lname)
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.never)
                        
                    }
                    .frame(width:400)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .frame(width: 400)
                    TextField("Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .frame(width: 400)
                    TextField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .privacySensitive()
                        .frame(width: 400)
                    HStack(alignment: .center,spacing:5){
                        NavigationLink(destination: ContentView()) {
                            Text("Already have one?")
                                .foregroundColor(.white)
                                .font(.system(size:20, weight:.medium, design:.rounded))
                            Text("Sign in")
                                .font(.system(size:20, weight:.medium, design:.rounded))
                        }
                        Spacer()
                        Button{
                            register()
                        } label: {
                            Text("Create Account")
                                .font(.system(size:20, weight:.medium, design:.rounded))
                                .buttonStyle(.borderedProminent)
                        }
                        Spacer()
                    }
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
