//
//  DismissBiew.swift
//  ProyectoCore
//
//  Created by mac20@ioslabacatlan.appleid.com on 22/10/23.
//

import SwiftUI

struct DismissBiew: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack{
            Spacer()
            Button("Cerrar") {
                dismiss()
            }
            .tint(.black)
            .padding(.trailing, 12)
        }
        .foregroundColor(.blue)
        .font(.title3)
        //.buttonStyle(.bordered)
    }
}

#Preview {
    DismissBiew()
}
