//
//  NewAccountDetails.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/26/23.
//

import Foundation

struct NewAccountDetails{
    var email: String
    var username: String
    var password: String
    var fname: String
    var lname: String
}

extension NewAccountDetails{
    static var new: NewAccountDetails{
        NewAccountDetails(email: "", username: "", password: "", fname: "", lname: "")
    }
}

