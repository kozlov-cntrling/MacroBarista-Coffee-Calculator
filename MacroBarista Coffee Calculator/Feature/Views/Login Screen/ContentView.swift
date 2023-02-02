import SwiftUI
import Firebase

struct ContentView: View {
    @State private var showCreateAccount =  false
    @State private var showForgotPassword =  false
    @EnvironmentObject var SessionService: SessionServiceImp
    
    @StateObject public var vm = LoginViewModelImp(
        service: LoginServiceImp()
    )
    var body: some View {
        NavigationView{
            
                ZStack{
                    Image("background")
                        .resizable()
                        .cornerRadius(20)
                        .ignoresSafeArea()
                    VStack(alignment: .leading){
                        Image("login-logo")
                            .resizable()
                            .frame(minWidth: 0, maxHeight: 290, alignment: .topLeading)
                        if vm.hasError == true{
                            HStack(alignment: .center){
                            Text("Login")
                                .font(.system(size: 40, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                                VStack(){
                                    Spacer().frame(height:20)
                                    Text("*Wrong email or password")
                                        .font(.system(size: 15, weight: .medium, design: .rounded))
                                        .foregroundColor(Color.red.opacity(0.8))
                                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                                }
                            }
                            TextBoxView(text: $vm.credentials.email, placeholder: "Email", keyboard: .emailAddress, sfSymbol: "envelope.fill")
                                .textInputAutocapitalization(.never)
                            PasswordBoxView(password: $vm.credentials.password,placeholder: "Password", sfSymbol: "lock.fill")
                                .textInputAutocapitalization(.never)
                        } else {
                            Text("Login")
                                .font(.system(size: 40, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            TextBoxView(text: $vm.credentials.email, placeholder: "Email", keyboard: .emailAddress, sfSymbol: "envelope.fill")
                                .textInputAutocapitalization(.never)
                            PasswordBoxView(password: $vm.credentials.password,placeholder: "Password", sfSymbol: "lock.fill")
                                .textInputAutocapitalization(.never)
                        }
                        HStack{
                            Button("Create New Account", action: {
                                showCreateAccount.toggle()
                            })
                            .sheet(isPresented: $showCreateAccount, content: {
                                CreateAccountView()
                            })
                            .transition(.scale)
                            Spacer()
                            Button("Login", action: {
                                vm.login()
                            })
                                .buttonStyle(.borderedProminent)
                            Spacer()
                        }
                        Spacer().frame(height:10)
                        Button("Forgot password?", action:{
                            showForgotPassword.toggle()
                        })
                        .sheet(isPresented: $showForgotPassword, content: {
                            ForgotPasswordView()
                        })
                    }
                    .frame(width:310)
                    .padding()
                    .frame(minWidth: 310, maxHeight: .infinity, alignment: .topLeading)
                }
                .transition(.scale)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionServiceImp())
    }
}
