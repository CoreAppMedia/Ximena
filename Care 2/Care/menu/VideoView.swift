//
//  VideoView.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 26/10/23.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var body: some View {
     
        NavigationView {
                VStack{
                    Image("play")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                    Spacer()
                NavigationLink(destination: SegundaVista()) {
                    Image(systemName: "1.square.fill")
                        .font(.system(size: 80)) //
                    
                    NavigationLink(destination: TerceraVista()) {
                        Image(systemName: "2.square.fill")
                            .font(.system(size: 80)) //
                    }
                    NavigationLink(destination: CuartaVista()) {
                        Image(systemName: "3.square.fill")
                            .font(.system(size: 80)) //
                    }
                    NavigationLink(destination: QuintaVista()) {
                        Image(systemName: "4.square.fill")
                            .font(.system(size: 80)) //
                    }
                        
                    
                }
            
            }
           
        }//navigation
    }
}
struct SegundaVista: View {
   
    var body: some View {
          Video1()
    }
}
struct TerceraVista: View {
    var body: some View {
        Text("Esta es la tercera vista")
    }
}
struct CuartaVista: View {
    var body: some View {
        Text("Esta es la cuarta vista")
    }
}
struct  QuintaVista: View {
    var body: some View {
        Text("Esta es la quinta vista")
    }
}

#Preview {
    VideoView()
}
