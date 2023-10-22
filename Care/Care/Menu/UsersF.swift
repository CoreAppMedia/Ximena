//
//  UsersF.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 21/10/23.
//

import SwiftUI

struct UsersF: View {
    @ObservedObject var authenticationViewMondel: AuthenticationViewModel
    @Binding var showMenu: Bool
    var body: some View {
        ZStack{
            NavigationView{
                Text("Bienvenide \(authenticationViewMondel.user?.email ?? "no user")")
                    .padding(.top, 32)
                Spacer()
            }//vstak
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .toolbar{
                Button("Logout") {
                    authenticationViewMondel.logout()
                }
            }
        }
    }
}

#Preview {
    Base(authenticationViewMondel: AuthenticationViewModel())
}
