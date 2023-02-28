import SwiftUI
import Firebase
//TODO: add login with appleID/Google
///TODO: add button that makes password field string viewable
///Solution: Toggle securefield to regular textfield when button is pressed
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
                                    if case .fail(let error) = vm.state{
                                        HStack(alignment: .center){
                                            Image(systemName:"exclamationmark.triangle.fill")
                                                .foregroundColor(Color.red.opacity(1))
                                            Text(error.localizedDescription)
                                                .foregroundColor(Color.red.opacity(0.9))
                                        }
                                        .padding(5)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                .stroke(Color.red, lineWidth: 4)
                                                .background(RoundedRectangle(cornerSize: CGSize())
                                                    .fill(.red)
                                                    .opacity(0.45))
                                            //Next opacity call adjusts multiplies the opacity for the fill and text of error message
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
