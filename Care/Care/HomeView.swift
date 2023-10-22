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
    @Binding var showMenu: Bool
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
        NavigationView{
            ZStack{
           
                Text("Bienvenide \(authenticationViewMondel.user?.email ?? "no user")")
                    .padding(.top, 32)
                Spacer()
            //vstak
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Homes")
            .toolbar{
                Button("Logout") {
                    authenticationViewMondel.logout()
                    }
                }//logout
                VStack(spacing:0){
                    TabView(selection: $currentTab){
                        //Este "Text" se repetira dependiendo el  numero de botones que etengan en el menu lateral(SideMenu), en este caso son 7
                        Text("Bienvenide \(authenticationViewMondel.user?.email ?? "no user")")
                            .toolbar{
                                Button("Logout") {
                                    authenticationViewMondel.logout()
                                }
                            }
                            .padding(.top, 32)
                        Spacer()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Homes")
                   
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
                            TabButton(image: "info.bubble")
                            TabButton(image: "person")
                            
                        }//HStack de los botones para seleccionar una View principal
                        .padding([.top],15)
                    }

                    
                }//VStack
            }
        }
       

    }
    @ViewBuilder
    func TabButton(image: String)->some View{
        Button{
            withAnimation{currentTab = image}
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
    Base(authenticationViewMondel: AuthenticationViewModel())
}
