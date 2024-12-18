//
//  OtherScreen.swift
//  HelloWorld
//
//  Created by Aditya on 17/12/24.
//

import SwiftUI

struct TextScreen: View {
    var body: some View {
        VStack {
            Text("Regular Text")
            Text("Large title").font(.largeTitle)
            Text("Title").font(.title)
            Text("Title2").font(.title2)
            Text("Title3").font(.title3)
            Text("Bold text").fontWeight(.bold)
            Text("Italic text").italic()
            Text("Thin text").fontWeight(.thin)
            Text("Light text").fontWeight(.light)
            Text("Blurred text").blur(radius: 5)
            Text("Shadow text").shadow(color: Color.black, radius: 5)
            Text("Colored text").foregroundStyle(Color.red)
        }
    }
}
