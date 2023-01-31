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
                    
                    VStack(alignment: .leading, spacing:20){
                        Spacer()
                        Image("Strong AF")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                        
                        if vm.hasError == true{
                            Text("Login")
                                .font(.system(size: 40, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            HStack(){
                                Text("*Wrong email or password")
                                    .font(.system(size: 20, weight: .medium, design: .serif))
                                    .foregroundColor(.red)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                TextBoxView(text: $vm.credentials.email, placeholder: "Email", keyboard: .emailAddress, sfSymbol: "envelope.fill")
                                    .textInputAutocapitalization(.never)
                                PasswordBoxView(password: $vm.credentials.password,placeholder: "Password", sfSymbol: "lock.fill")
                                    .textInputAutocapitalization(.never)
                            }
                        } else {
                            Text("Login")
                                .font(.system(size: 40, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            //TODO: change text to email box
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
                        Button("Forgot password?", action:{
                            showForgotPassword.toggle()
                        })
                        .sheet(isPresented: $showForgotPassword, content: {
                            ForgotPasswordView()
                        })
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    .frame(width:310)
                    .padding()

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
