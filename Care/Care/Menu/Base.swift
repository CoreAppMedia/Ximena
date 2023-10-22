//
//  Base.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 21/10/23.
//

import SwiftUI

struct Base: View {
    @ObservedObject var authenticationViewMondel: AuthenticationViewModel
    @State var ShowMenu: Bool = false
    var body: some View {
        Menu(authenticationViewMondel: AuthenticationViewModel())
            .toolbar{
                Button("Logout") {
                    authenticationViewMondel.logout()
                }
            }

    }
}

#Preview {
    Base(authenticationViewMondel: AuthenticationViewModel())
}
