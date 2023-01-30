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
    @State private var emailSent = false
    @State private var emailError = false
    
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
                    TextBoxView(text: .constant("example.person@gmail.com") ,placeholder: "Email", keyboard: .emailAddress, sfSymbol: "envelope.fill")
                    
                    Button("Send Password Reset", action:{})
                        .frame(maxWidth: .infinity, minHeight: 10)
                        .buttonStyle(.borderedProminent)
                    //Verifies and notifies user if email is valid
                }
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
