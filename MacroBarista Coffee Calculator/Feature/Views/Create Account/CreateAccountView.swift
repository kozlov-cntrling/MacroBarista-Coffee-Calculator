import SwiftUI
import Firebase

struct CreateAccountView: View {

    @StateObject var vm = CreateAccountVMImp(
        service: CreateAccountServiceImp()
    )
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    var body: some View {

        NavigationView {
            ZStack{
                Image("background")
                    .resizable()
                    .cornerRadius(20)
                    .ignoresSafeArea()
                VStack(alignment: .leading){
                    Text("**Create an account**")
                        .foregroundColor(.white)
                        .font(.system(size:36, weight:.light, design:.rounded))
                        .frame(alignment: .leading)
                    
                    //Visual error handling
                    if vm.hasError{
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
                    //All textboxes in this VStack
                    VStack(spacing: 15){
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
                        
                        HStack(alignment: .center){
                            Spacer()
                            ButtonView(title: "Create Account", sfSymbol: "", width: 200){
                                vm.register()
                            }
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 15)
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
