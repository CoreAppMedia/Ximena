//
//  HomeView.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 19/10/23.
//

import SwiftUI
//aqui es donde abre al app, se puede agregar lo demas menu o lo que sea
struct HomeView: View {
    @ObservedObject var authenticationViewMondel: AuthenticationViewModel
    var body: some View {
        NavigationView{
            VStack{
                Text("Bienvenido \(authenticationViewMondel.user?.email ?? "no user")")
                    .padding(.top, 32)
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
    HomeView(authenticationViewMondel: AuthenticationViewModel())
}
