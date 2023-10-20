//
//  RegisterEmailView.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 19/10/23.
//

import SwiftUI

struct RegisterEmailView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var textFieldEmail: String = ""
    @State var textFielPassword: String = ""
    var body: some View {
        VStack{
            DismissView()
                .padding(.top, 8)//para cerrar la vista
            Group {
                Text("Bienvenidos a")
                Text("Care")
                    .bold()
                    .underline()
            }//vstal de los titulos
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.black)
            Group {
                Text("Registrate con tu Email y con una contraseña que recuerdes")
                    .tint(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                TextField("Digita tu Email", text: $textFieldEmail)
                TextField("Digita tu Contraseña", text: $textFielPassword)
                Button("Aceptar"){
                    authenticationViewModel.createNewUser(email: textFieldEmail,password: textFielPassword)
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.purple)
                if let messageError = authenticationViewModel.messageError {
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top, 20)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            Spacer()
            
        }
    }
}

#Preview {
    RegisterEmailView(authenticationViewModel: AuthenticationViewModel())
}
