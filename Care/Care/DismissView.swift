//
//  DismissView.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 19/10/23.
//

import SwiftUI

struct DismissView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack{
            Spacer()
            Button("Cerrar"){
                dismiss()
            }
            .tint(.black)
            .padding(.trailing, 12)
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    DismissView()
}
