import SwiftUI
import Firebase

extension ContentView{
    
    class ViewModel: ObservableObject{
        @EnvironmentObject var SessionService: SessionServiceImp
        
        func testPress(){
            print("Button pressed")
        }
    }
}
