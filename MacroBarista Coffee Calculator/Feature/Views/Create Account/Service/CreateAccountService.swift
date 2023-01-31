//
//  CreateAccountService.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/26/23.
//
import Firebase
import FirebaseDatabase
import Combine
import Foundation

enum AccountKeys: String{
    case fname
    case lname
}

protocol CreateAccountService{
    func NewAccount(with detiails: NewAccountDetails) -> AnyPublisher<Void, Error>
}

final class CreateAccountServiceImp: CreateAccountService{
func NewAccount(with detiails:NewAccountDetails) -> AnyPublisher<Void, Error>{
    Deferred{
        Future{ promise in
            Auth.auth().createUser(withEmail: detiails.email, password: detiails.password) {res, error in
                if let err = error{
                    //Failed to create account
                    promise(.failure(err))
                } else {
                    //Sucessfully created user
                    if let uid = res?.user.uid{
                        let values = [AccountKeys.fname.rawValue: detiails.fname,
                                      AccountKeys.lname.rawValue: detiails.lname] as [String:Any]
                        Database.database()
                            .reference()
                            .child("users")
                        //associates data with user
                            .child(uid)
                            .updateChildValues(values) { error, ref in
                                if let err = error {
                                    promise(.failure(err))
                                } else {
                                    //pushes back void to user, TODO: make function update UI
                                    promise(.success(()))
                                }
                                
                            }
                        //Cannot fetch user key
                    } else {
                        promise(.failure(NSError(domain: "Invalid User Key", code: 0, userInfo: nil)))
                    }
                    
                }
            }
            }
        }
    .receive(on: RunLoop.main)
    .eraseToAnyPublisher()
    }
}

