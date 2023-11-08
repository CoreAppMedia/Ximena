//
//  Home.swift
//  AnimatedTabBar
//
//  Created by ximena juana mejia jacobo on 21/10/23.
//

import SwiftUI
import AVKit
struct Home: View {
    let url = URL(string: "https://media.giphy.com/media/30pN3SpT0j8dcH2Q4U/giphy.mp4")!
    var body: some View {
        VideoPlayer(player: .init(url: url))
        }
}

#Preview {
    Home()
}
