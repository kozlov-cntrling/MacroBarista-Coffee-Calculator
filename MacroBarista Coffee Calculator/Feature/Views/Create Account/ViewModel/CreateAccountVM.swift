import Foundation
import Combine

enum CreateAccountState{
    case success
    case fail(error:Error)
    case NA
}

protocol CreateAccountVM {

    func register()
    
    var service: CreateAccountService {get}
    
    var state:  CreateAccountState {get}
    
    var userdetails: NewAccountDetails {get}
    
    var hasError: Bool {get}
    //Init runs newAccount function
    init(service: CreateAccountService)
}

final class CreateAccountVMImp: ObservableObject, CreateAccountVM {
    @Published var state: CreateAccountState = .NA
    @Published var hasError: Bool = false
    
    let service: CreateAccountService
    
    private var Subscriptions = Set<AnyCancellable>()
    
    init(service: CreateAccountService) {
        self.service = service
        setupErrorSubscription()
    }
    
    @Published var userdetails: NewAccountDetails = NewAccountDetails.new

    func register() {
        service
            .NewAccount(with: userdetails)
        //sink
            .sink{ [weak self] res in
                //based on result, switches state from success or fail
                switch res{
                case .failure(let error):
                    self?.state = .fail(error: error)
                default: break
                }
            }   receiveValue : { [weak self] in
                    self?.state = .success
            }
            .store(in: &Subscriptions)
    }
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
