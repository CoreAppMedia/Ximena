//
//  Menu.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 21/10/23.
//

import SwiftUI

struct Menu: View {
    @ObservedObject var authenticationViewMondel: AuthenticationViewModel

    @State var ShowMenu: Bool = false
    //ocultar un nativo
   
    
    //variable para seleccionar una View
    @State var currentTab = "Home"
    
//offset para arrastrar gesuture y mostrar Menú
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    //Desplazamiento del gesto
    @GestureState var gestureOffset: CGFloat = 0
    var body: some View {
 
        //vista de la navegacion completa
        NavigationView{
            HStack(spacing: 0){
                // Vista de la pestaña Principal
                VStack(spacing:0){
                    TabView(selection: $currentTab){
                        //Este "Text" se repetira dependiendo el  numero de botones que etengan en el menu lateral(SideMenu), en este caso son 7
                        Text("Home")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("house")
                        RutineF(showMenu: $ShowMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("figure.run.circle")
                        Text("notificaciones")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("info.bubble")
                        UsersF(authenticationViewMondel: AuthenticationViewModel(), showMenu: $ShowMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("person")
                    }//TabView
                    
                    VStack(spacing:0){
                        Divider()
                        HStack(spacing:0){
                            TabButton(image: "house")
                            TabButton(image: "figure.run.circle")
                            Button("Logout") {
                                authenticationViewMondel.logout()
                            }
                            TabButton(image: "info.bubble")
                            TabButton(image: "person")
                            
                        }//HStack de los botones para seleccionar una View principal
                        .padding([.top],15)
                    }
                    
                    
                }//VStack

                //   .frame(width: getRect().width)
                //BG cuando se muestra el menú
                
            }
            //tamaño máximo
        }
       
        
    }
   
 
    @ViewBuilder
    func TabButton(image: String)->some View{
        Button{
            withAnimation{currentTab = image}
            authenticationViewMondel.logout()
        }label: {
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(currentTab == image ? .primary : .black)
                    .frame(maxWidth: .infinity)
        }
    }//Termina Funcion
    
    
    
}

#Preview {
    Menu(authenticationViewMondel: AuthenticationViewModel())
}
