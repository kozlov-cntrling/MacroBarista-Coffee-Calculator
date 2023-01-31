//
//  SessionService.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/27/23.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase

enum SessionState{
    case loggedIn
    case loggedOut
}

protocol SessionService {
    //state
    var state:SessionState {get}
    var userDetails: SessionUserDetails? {get}
    func logOut()
}

final class SessionServiceImp: ObservableObject, SessionService {
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: SessionUserDetails?
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        setupFireBaseAuthHandler()
    }
    
    func logOut() {
        try? Auth.auth().signOut()
    }
}
private extension SessionServiceImp {
    func setupFireBaseAuthHandler(){
        
        handler = Auth
            .auth()
            .addStateDidChangeListener{[weak self] res, user in
                guard let self = self else {return}
                //checks user, if nil then loggedout, if not nil then loggedin
                self.state = user == nil ? .loggedOut : .loggedIn
            }
    }
    //passes userid
    func handleRefresh(with uid:String){
        
        Database
            .database()
            .reference()
            .child("users")
            .child(uid)
            .observe(.value) { [weak self] snapshot in
                guard let self = self,
                        let value = snapshot.value as? NSDictionary,
                        let fname = value[AccountKeys.fname.rawValue] as? String,
                        let lname = value[AccountKeys.lname.rawValue] as? String else {
                    return
                }
                DispatchQueue.main.async{
                    self.userDetails = SessionUserDetails(fname: fname, lname: lname)
                }
            }
    }
}
