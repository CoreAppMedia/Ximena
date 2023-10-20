//
//  ContentView.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 18/10/23.
//

import SwiftUI
enum AuthenticationSheetView: String, Identifiable{
    case register
    case login
    var id: String{
        return rawValue
    }
}

struct AuthenticationView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var authenticationSheetView: AuthenticationSheetView?
    
    var body: some View {
        
        VStack { 
            Image("human")
                .resizable()
                .frame(width: 200, height: 200)
            VStack{
                Button{
                    authenticationSheetView = .login
                } label: {
                    Label("Entra con Email", systemImage: "envelope.fill")
                }
                .tint(.black)
            }
            .controlSize(.large)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .padding(.top,60)
            Spacer()
            HStack{
                Button{
                    authenticationSheetView = .register
                } label: {
                    Text("¿No tienes cuenta?")
                    Text("registrate")
                }
                .tint(.black)
            }//hstack
        }
        .sheet(item: $authenticationSheetView) { sheet in
            switch sheet {
            case .register:
                RegisterEmailView(authenticationViewModel: authenticationViewModel)
                
            case .login:
                LoginEmailView(authenticationViewModel: authenticationViewModel)
            }
            //aqui hacemos que los botones entren a las vistas
        }
        
    }
}


#Preview {
    AuthenticationView(authenticationViewModel: AuthenticationViewModel())
}
