//
//  ForgotPasswordService.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/31/23.
//
import FirebaseAuth
import Foundation
import Combine

protocol ForgotPasswordService{
    func sendPasswordReset(to email: String) -> AnyPublisher<Void, Error>
}
final class ForgotPasswordServiceImp: ForgotPasswordService {
    
    func sendPasswordReset(to email: String) -> AnyPublisher<Void, Error>   {
        
        Deferred {
            
            Future{ promise in
                Auth
                    .auth()
                    .sendPasswordReset(withEmail: email) { error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                    }
            }
        }
        .eraseToAnyPublisher()
    }
}
