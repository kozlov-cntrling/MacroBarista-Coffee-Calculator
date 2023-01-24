import SwiftUI
import Firebase

//login-screen information, extension adds functionality to existing function
extension ContentView{
    //observableobject allows data to be fetched from account combination database
    class ViewModel: ObservableObject{
        @AppStorage("AUTH_KEY") var authenticated = false {
            willSet{objectWillChange.send() }
        }
        @AppStorage("USER_KEY") var username = "username"
        @Published var password = ""
        @Published var invalid: Bool = false
        //Future admin user, testpass only usuable in class viewmodel
        //toggles authentication, user does not need to log back in if closes the app
        func toggleAuthentication(){
            self.password = ""
            withAnimation {
                authenticated.toggle()
            }
        }
        //username and password verification needs to be reworked to work with firebase
        func authenticate(){
            guard self.username.lowercased() == "" else{
                self.invalid = true
                return
            }
            guard self.password.lowercased() == "" else{
                self.invalid = true
                return
            }
            //runs the toggle func above
            toggleAuthentication()
            
        }
        func logOut(){
            toggleAuthentication()
        }
        
        func testPress(){
            print("Button pressed")
        }
    }
}
