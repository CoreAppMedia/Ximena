//
//  ContentView.swift
//  PhoneNumber
//
//  Created by ximena juana mejia jacobo on 17/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var phoneNumber = ""
    var body: some View {
      
                   TextField("Ingrese su número de teléfono", text: $phoneNumber)
                .keyboardType(.numberPad)
               
        .padding()
                .onChange(of: phoneNumber) { newValue in
                    if newValue.count > 10 {
                        phoneNumber = String(newValue.prefix(10))
                    }
                }    }
}

#Preview {
    ContentView()
}
