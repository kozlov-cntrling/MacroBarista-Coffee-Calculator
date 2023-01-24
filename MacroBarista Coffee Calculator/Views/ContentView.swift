import SwiftUI
import Firebase

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        if !vm.authenticated{
            VStack{
                Button("Logout", action: vm.logOut)
                    .tint(.red)
                    .buttonStyle(.bordered)
                Text("**\(vm.username)**")
            }
        }
        else{
            NavigationView{
                ZStack{
                    Image("background")
                        .resizable()
                        .cornerRadius(20)
                        .ignoresSafeArea()
                    VStack(alignment: .leading, spacing:20){
                        Spacer()
                        Image("Strong AF")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                        Text("Login")
                            .font(.system(size: 40, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                        TextField("Username", text: $vm.username)
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.never)
                        SecureField("Password", text: $vm.password)
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.never)
                            .privacySensitive()
                        
                        HStack{
                            NavigationLink(destination: CreateAccount_View()){
                                Text("Create New Account")
                                .tint(.blue)
                            }
                            .transition(.scale)
                            Spacer()
                            Button("Login", action: vm.authenticate)
                                .buttonStyle(.borderedProminent)
                            Spacer()
                        }
                        Button("Forgot password?", action:vm.testPress)
                            .tint(.blue)
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    .alert("Wrong username/password", isPresented: $vm.invalid){
                        Button("Dismiss",action: vm.testPress)
                    }
                    .frame(width:310)
                    .padding()
                }
                .transition(.scale)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
