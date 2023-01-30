import SwiftUI
import Firebase

struct CreateAccountView: View {
    //TODO: Make strings parse to createaccountdetails
    @StateObject var vm = CreateAccountVMImp(
        service: CreateAccountServiceImp()
    )
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack{
                Image("background")
                    .resizable()
                    .cornerRadius(20)
                    .ignoresSafeArea()
                VStack(alignment: .center,spacing: 25){
                    Text("**Create an account**")
                        .foregroundColor(.white)
                        .font(.system(size:36, weight:.medium, design:.rounded))
                        .frame(height: 30, alignment: .leading)
                    HStack(spacing: 15){
        
                        TextBoxView(text: $vm.userdetails.fname ,placeholder: "First name", keyboard: .default, sfSymbol: nil)
                        TextBoxView(text: $vm.userdetails.lname ,placeholder: "Last name", keyboard: .default, sfSymbol: nil)
                    }
                    .frame(maxWidth: 405)
                    TextBoxView(text: $vm.userdetails.email, placeholder: "Email", keyboard: .emailAddress, sfSymbol: "envelope")
                            .textInputAutocapitalization(.never)
                    TextBoxView(text: $vm.userdetails.username, placeholder: "Username", keyboard: .emailAddress, sfSymbol: "person")
                            .textInputAutocapitalization(.never)
                    PasswordBoxView(password: $vm.userdetails.password,placeholder: "Password", sfSymbol: "lock.fill")
                            .textInputAutocapitalization(.never)
                    HStack(alignment: .center,spacing:5){
                        Spacer()
                        Button{
                            vm.register()
                        } label: {
                            Text("Create New Account")
                                .font(.system(size:20, weight:.medium, design:.rounded))
                                .padding()
                                .underline()
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: 405)
                .applyClose()
            }
        }
    }
}

struct CreateAccount_View_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
