import SwiftUI
import Firebase

extension ContentView{
    
    class ViewModel: ObservableObject{
        @State var authenticated: Bool = false
        @EnvironmentObject var SessionService: SessionServiceImp
        
        func testPress(){
            print("Button pressed")
        }
    }
}
