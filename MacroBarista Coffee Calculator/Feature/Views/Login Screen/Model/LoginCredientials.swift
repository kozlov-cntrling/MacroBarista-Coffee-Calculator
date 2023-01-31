//
//  LoginCredientials.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/29/23.
//

import Foundation

struct LoginCredentials{
    var email: String
    var password: String
}

extension LoginCredentials{
    
    static var new: LoginCredentials{
        LoginCredentials(email: "", password: "")
    }
}
