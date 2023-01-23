//
//  CreateAccount Controller.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/22/23.
//
import SwiftUI
import Firebase

extension CreateAccount_View{
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}
