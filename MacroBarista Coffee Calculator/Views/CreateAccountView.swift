//
//  CreateAccount View.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/22/23.
//

import SwiftUI
import Firebase

struct CreateAccountView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                Image("background")
                    .resizable()
                    .cornerRadius(20)
                    .ignoresSafeArea()
                VStack(alignment: .center,spacing: 25){
                    Text("**Create an account**")
                        .foregroundColor(.white)
                        .font(.system(size:36, weight:.medium, design:.rounded))
                        .frame(height: 30, alignment: .leading)
                    HStack(spacing: 15){
                        TextBoxView(text: $vm.fname ,placeholder: "First name", keyboard: .default, sfSymbol: nil)
                        TextBoxView(text: $vm.lname ,placeholder: "Last name", keyboard: .default, sfSymbol: nil)
                    }
                    .frame(maxWidth: 405)
                    TextBoxView(text: $vm.email, placeholder: "Email", keyboard: .emailAddress, sfSymbol: "envelope")
                            .textInputAutocapitalization(.never)
                    TextBoxView(text: $vm.username, placeholder: "Username", keyboard: .emailAddress, sfSymbol: "person")
                            .textInputAutocapitalization(.never)
                    PasswordBoxView(password: $vm.password,placeholder: "Password", sfSymbol: "lock.fill")
                            .textInputAutocapitalization(.never)
                    HStack(alignment: .center,spacing:5){
                        Spacer()
                        Button{
                            register()
                        } label: {
                            Text("Create New Account")
                                .font(.system(size:20, weight:.medium, design:.rounded))
                                .padding()
                                .underline()
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: 405)
            }
        }
    }
}

struct CreateAccount_View_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
