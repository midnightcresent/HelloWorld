//
//  ImageScreen.swift
//  HelloWorld
//
//  Created by Aditya on 17/12/24.
//

import SwiftUI

struct ImageScreen: View {
    var body: some View {
        ScrollView {
            Image(.imgJohnDoe)
            Image(.imgJohnDoe)
                .renderingMode(.template)
                .foregroundStyle(Color.red)
            Image(.imgJohnDoe)
                .blur(radius: 10)
            Image(.imgJohnDoe)
                .clipShape(Rectangle())
            Image(.imgJohnDoe)
                .overlay(Text("Hello World!"))
        }
    }
}
