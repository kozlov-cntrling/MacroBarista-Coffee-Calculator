//
//  ForgotPasswordView.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 1/25/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import Firebase

struct ForgotPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var vm = ForgotPasswordVMImp(
        service: ForgotPasswordServiceImp()
    )
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("background")
                    .resizable()
                    .cornerRadius(20)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing:30){
                    Text("**Forgot Password?**")
                        .foregroundColor(.white)
                        .font(.system(size:36, weight:.medium, design:.rounded))
                        .frame(height: 30)
                        .frame(maxWidth: 305)
                    TextBoxView(text: $vm.email, placeholder: "Email", keyboard: .emailAddress, sfSymbol: "envelope.fill")
                    
                    Button("Send Password Reset", action:{
                        vm.sendPasswordReset()
                        presentationMode.wrappedValue.dismiss()
                    })
                        .frame(maxWidth: .infinity, minHeight: 10)
                        .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal, 15)
            }
            .applyClose()
        }
    }
    
    
    struct ForgotPasswordView_Previews: PreviewProvider {
        static var previews: some View {
            ForgotPasswordView()
        }
    }
}
