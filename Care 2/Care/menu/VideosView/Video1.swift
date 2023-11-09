//
//  Video1.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 26/10/23.
//

import SwiftUI
import AVKit
struct Video1: View {
    let url = URL(string: "https://media.giphy.com/media/kF6feGLva6p05Bg52U/giphy.mp4")!
    var body: some View {
        VideoPlayer(player: .init(url: url))
    }
}

#Preview {
    Video1()
}
