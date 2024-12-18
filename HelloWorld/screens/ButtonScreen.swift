//
//  ButtonScreen.swift
//  HelloWorld
//
//  Created by Aditya on 17/12/24.
//

import SwiftUI

struct ButtonScreen: View {
    @State private var isToggled = false
    var body : some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                Button("Normal Button") {
                    print("Normal button pressed")
                }
                Spacer().frame(height: 20)
                Button(action: { print("Icon button pressed") }) {
                    Image(systemName: "person.fill")
                        .font(.title)
                }
                Spacer().frame(height: 20)
                Button("Shadow Button") {
                    print("Shadow button pressed")
                }
//                .padding()
                .shadow(color: Color.black, radius: 5)
                Spacer().frame(height: 20)
                Button(action: { print("Gradient Button pressed") }) {
                    Text("Gradient")
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(10)
                }
                Spacer().frame(height: 20)
                Button("Outlined Button") {
                    print("Outlined button pressed")
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                Spacer().frame(height: 20)
                Button("Disabled Button") { }
                    .disabled(true)
                Spacer().frame(height: 20)
                
                Button(action: { isToggled.toggle() }) {
                    Text(isToggled ? "ON" : "OFF")
                        .padding()
                        .background(isToggled ? Color.green : Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer().frame(height: 20)
                textContent
            }.frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
    @ViewBuilder
    var textContent: some View {
        if isToggled {
            Text("Hello World")
        }
    }
}

#Preview { ButtonScreen() }
