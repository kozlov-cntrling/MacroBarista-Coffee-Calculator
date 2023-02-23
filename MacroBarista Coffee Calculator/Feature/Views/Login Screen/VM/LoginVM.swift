//
//  LoginVM.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/29/23.
//

import Foundation
import Combine

enum LoginState{
    case success
    case fail(error:Error)
    case NA
}

protocol LoginVM{
    func login()
    var service: LoginService {get}
    var state: LoginState {get}
    var hasError: Bool {get}
    var credentials: LoginCredentials {get}
    init(service: LoginService)
}

final class LoginViewModelImp: ObservableObject, LoginVM {
    
    @Published var state: LoginState = .NA
    @Published var credentials: LoginCredentials = LoginCredentials.new
    @Published var hasError: Bool = false
    
    private var subscription = Set<AnyCancellable>()
    
    let service: LoginService
     
    init(service: LoginService) {
        self.service = service
        setupErrorSubscription()
    }
    
    func login() {
        service
            .login(with: credentials)
            .sink { res in
                
                switch res {
                case .failure(let err):
                    self.state = .fail(error: err)
                default: break
                }
                
            } receiveValue: { [weak self] in
                self?.state = .success
            }
            .store(in:&subscription)
    }
}
//Observes state for errors in login attempt
private extension LoginViewModelImp {
    
    func setupErrorSubscription() {
        
        $state
            .map { state -> Bool in
                switch state {
                case .success,
                        .NA:
                    return false
                case .fail:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}
