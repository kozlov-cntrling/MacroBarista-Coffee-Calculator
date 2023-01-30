//
//  CreateAccount Controller.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/22/23.
//
import SwiftUI
import Firebase

extension CreateAccountView{
    class ViewModel: ObservableObject{
        @Published var password = ""
        @Published var fname = ""
        @Published var lname = ""
        @Published var username = ""
        @Published var email = ""
    }
    func register(){
        Auth.auth().createUser(withEmail: vm.userdetails.email, password: vm.userdetails.password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}
