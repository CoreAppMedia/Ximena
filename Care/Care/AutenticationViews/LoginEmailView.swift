//
//  LoginEmailView.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 19/10/23.
//

import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var textFieldEmail: String = ""
    @State var textFielPassword: String = ""
    var body: some View {
        VStack{
            DismissView()
                .padding(.top, 8)//para cerrar la vista
            Group {
                Text("Hola Bienvenidos a")
                Text("Care")
                    .bold()
                    .underline()
            }//vstal de los titulos
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.black)
            Group {
                Text("Entra con tu Email y comienza a usar la app")
                    .tint(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                TextField("Digita tu Email", text: $textFieldEmail)
                TextField("Digita tu Email", text: $textFielPassword)
                Button("Login"){
                    authenticationViewModel.login(email: textFieldEmail, password: textFielPassword)
                  
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.purple)
                if let messageError = authenticationViewModel.messageError{
                    Text(messageError)
                        .bold()
                        .foregroundColor(.red)
                        .padding(.top,20)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            Spacer()
            
        }
    }
}

#Preview {
    LoginEmailView(authenticationViewModel: AuthenticationViewModel())
}
