import Foundation
import Combine
//TODO: add visual error
enum CreateAccountState{
    case success
    case fail(error:Error)
    case NA
}

protocol CreateAccountVM {

    func register()
    var service: CreateAccountService {get}
    //handles changes in VM
    var state:  CreateAccountState {get}
    //binds field input into database
    var userdetails: NewAccountDetails {get}
    //initalizer injects service into VM
    var hasError: Bool {get}
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
        //gets value from publisher
            .NewAccount(with: userdetails)
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
    }
}
