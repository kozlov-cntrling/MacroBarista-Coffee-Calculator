//
//  ForgotPasswordVM.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/31/23.
//

import Foundation
import Combine

protocol ForgotPasswordVM{
    func sendPasswordReset()
    var service: ForgotPasswordService {get}
    var email: String {get}
    init(service: ForgotPasswordService)
}

final class ForgotPasswordVMImp: ObservableObject, ForgotPasswordVM   {
    
    @Published var email: String = ""
    let service: ForgotPasswordService
    
    private var subscription = Set<AnyCancellable>()
    
    init(service: ForgotPasswordService) {
        self.service = service
    }
    func sendPasswordReset() {
        
        service
            .sendPasswordReset(to: email)
        
            .sink { res in
                
                switch res {
                case .failure(let err):
                    print("Failed: \(err))")
                default: break
                }
                
            } receiveValue: {
                print("Password reset sent")
            }
            .store(in: &subscription)
    }
}
