import SwiftUI
import Firebase
//TODO: add login with appleID/Google
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
                            .frame(maxHeight: 290, alignment: .topLeading)
                            .frame(width:310)
                        //Visual login error handling
                        if vm.hasError{
                            HStack(alignment: .center){
                            Text("Login")
                                .font(.system(size: 40, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                                VStack(){
                                    //TODO: make error more pretty, add border box, and red info sfSymbol, and change error font
                                    if case .fail(let error) = vm.state{
                                        HStack(alignment: .center){
                                            Image(systemName:"exclamationmark.triangle.fill")
                                                .foregroundColor(Color.red.opacity(1))
                                            Text(error.localizedDescription)
                                                .foregroundColor(Color.red.opacity(0.8))
                                        }
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                .stroke(Color.red, lineWidth: 4)
                                                .opacity(0.3)
                                        )
                                        .font(.system(size: 15, weight: .medium, design: .rounded))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    } else {
                                    }
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
                    .frame(maxHeight: .infinity, alignment: .topLeading)
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
