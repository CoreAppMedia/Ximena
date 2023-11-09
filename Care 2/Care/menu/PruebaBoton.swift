//
//  PruebaBoton.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 22/10/23.
//

import SwiftUI

struct PruebaBoton: View {
    @State private var name: String = ""
       @State private var email: String = ""
       @State private var otherInfo: String = ""
    @ObservedObject var authenticationViewMondel: AuthenticationViewModel
    var body: some View {
        NavigationView{
           // Rectangle(Color: .green)
           
            VStack{
                ZStack {
                            Color.green
                                .opacity(0.8)
                                .frame(width: 393, height: 100)
                                .edgesIgnoringSafeArea(.top)
                        }
                Text("Bienvenido \(authenticationViewMondel.user?.email ?? "no user")")
                    .padding(.top, 32)
                    .font(.largeTitle)
                    
                
                Section(header: Text("Información de perfil")) {
                    TextField("Nombre", text: $name)
                    TextField("Correo electrónico", text: $email)
                    TextField("Otra información", text: $otherInfo)
                }
                .padding()
                Spacer()
               
                      
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            
           
                      
                   
            
           /* .toolbar{
                Button("Logout") {
                    authenticationViewMondel.logout()
                }
            }*/
        }
    }

}

#Preview {
    PruebaBoton(authenticationViewMondel: AuthenticationViewModel())
}
