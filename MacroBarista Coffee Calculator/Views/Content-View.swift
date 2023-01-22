import Foundation
import SwiftUI

//login-screen information, extension adds functionality to existing function
extension ContentView{
    //observableobject allows data to be fetched from account combination database
    class ViewModel: ObservableObject{
        @AppStorage("AUTH_KEY") var authenticated = false {
            willSet{objectWillChange.send() }
        }
        @AppStorage("USER_KEY") var username = "alex"
        @Published var password = "coffee"
        @Published var invalid: Bool = false
        //Future admin user, testpass only usuable in class viewmodel
        private var testUser = "alex"
        private var testPass = "coffee"
        
        init(){
            print("Login Status: \(authenticated)")
            print("Current user: \(username)")
        }
        func nonUser(){

        }
        //toggles authentication, user does not need to log back in if closes the app
        func toggleAuthentication(){
            self.password = ""
            withAnimation {
                authenticated.toggle()
            }
        }
        //username and password verification
        func authenticate(){
            guard self.username.lowercased() == testUser else{
                self.invalid = true
                return
            }
            guard self.password.lowercased() == testPass else{
                self.invalid = true
                return
            }
            //runs the toggle script above
            toggleAuthentication()
            
        }
        //
        func logOut(){
            toggleAuthentication()
        }
        
        func testPress(){
            print("Button pressed")
        }
    }
}
