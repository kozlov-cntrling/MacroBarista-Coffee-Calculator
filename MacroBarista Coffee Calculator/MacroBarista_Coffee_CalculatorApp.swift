import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct MacroBarista_Coffee_CalculatorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var SessionService = SessionServiceImp()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                switch SessionService.state {
                case .loggedIn:
                    Homepage()
                        .environmentObject(SessionService)
                case .loggedOut:
                    ContentView()
                }
            }
        }
    }
}
