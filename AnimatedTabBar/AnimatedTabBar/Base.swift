//
//  Base.swift
//  AnimatedTabBar
//
//  Created by ximena juana mejia jacobo on 21/10/23.
// quitar el .gif

import SwiftUI
import AVKit
struct Base: View {
    let url = URL(string: "https://media.giphy.com/media/kF6feGLva6p05Bg52U/giphy.mp4")!
        var body: some View {
            VideoPlayer(player: .init(url: url))
            }
}


#Preview {
    Base()
}
