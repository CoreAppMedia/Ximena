//
//  RecetaGeneral.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 31/10/23.
//

import SwiftUI

struct RecetaGeneral: View {

  @State private var searchText: String = ""

  private var searchResults: [EmojiDetails] {
    let results = EmojiProvider.all()
    if searchText.isEmpty { return results }
    return results.filter {
      $0.name.lowercased().contains(searchText.lowercased()) || $0.name.contains(searchText)
    }
  }
        
  private var suggestedResults: [EmojiDetails] {
    if searchText.isEmpty { return [] }
    return searchResults
  }
    var body: some View {
        NavigationView {
            List(searchResults) { emojiDetails in
                NavigationLink(destination: {
                    EmojiDetailsView(emojiDetails: emojiDetails)
                }) {
                    
                    HStack {
                        if emojiDetails.hasImage, let imageName = emojiDetails.image {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40) // Ajusta el tamaño de la miniatura de la imagen
                                .padding(.trailing, 8) // Espacio entre la imagen y el texto
                        }
                        Text(emojiDetails.name)
                            .padding(6)
                    }
                }
            }
            .navigationTitle("Recetas Generales🔍")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Busca tu receta..."
            ) {
                ForEach(suggestedResults) { emojiDetails in
                    Text("Estas buscando \(emojiDetails.name)?")
                        .searchCompletion(emojiDetails.name)
                }
            }
        }
    }

  /*var body: some View {
    NavigationView {
      List(searchResults) { emojiDetails in
        NavigationLink(destination: {
          EmojiDetailsView(emojiDetails: emojiDetails)
        }) {
          Text("\(emojiDetails.emoji) \(emojiDetails.name)")//creo que aqui le podemos colocar la imagen para que se vea una mini cosa de lo que puede ser
            .padding(6)
        }
      }
      .navigationTitle("Recetas Genrales🔍")
      .searchable(
        text: $searchText,
        placement: .navigationBarDrawer(displayMode: .always),
        prompt: "Busca tu receta..."
      ) {
        ForEach(suggestedResults) { emojiDetails in
          Text("Estas buscando \(emojiDetails.name)?")
            .searchCompletion(emojiDetails.name)
        }
      }
    }
  }*/
}



struct EmojiDetailsView: View {
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ScrollView{
            VStack {
                VStack(alignment: .leading) {
                    Text("\(emojiDetails.name)")
                        .font(.largeTitle)
                        .bold()
                    Text(emojiDetails.description)
                    Spacer()
                }
                Spacer()
                
                if emojiDetails.hasImage, let imageName = emojiDetails.image {
                    HStack{
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250) // Ajusta el tamaño según tus necesidades
                    }
                }
            }.padding([.leading, .trailing], 24)
        }
    }
}
    
#Preview {
    RecetaGeneral()
}
