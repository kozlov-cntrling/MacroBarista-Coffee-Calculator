import SwiftUI
import Firebase

@main
struct MacroBarista_Coffee_CalculatorApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
            CreateAccount_View()
        }
    }
}
