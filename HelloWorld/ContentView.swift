//
//  ContentView.swift
//  HelloWorld
//
//  Created by Aditya on 15/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNavigatingToButtonScreen = false
    @State private var isNavigatingToOtherScreen = false
    @State private var isNavigatingToImageScreen = false
    @State private var isOn: Bool = true
    @State private var tabContentText = "Uploads"
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    topAppBar
                        .frame(width: proxy.size.width)
                        .padding(.leading, 20)
                    Spacer().frame(height: 20)
                    profileHeader
                        .frame(width: proxy.size.width)
                        .padding(.trailing, 30)
                    Spacer().frame(height: 8)
                    Text("john.doe")
                        .font(Font.custom("Barlow-Regular", size: 40))
                    dashboardRow
                        .padding(.leading, 30)
                        .frame(width: proxy.size.width)
                    Divider()
                        .frame(width: 350)
                        .background(Color.gray)
                    Spacer().frame(height: 15)
                    primaryStats
                        .frame(width: proxy.size.width)
                    Spacer().frame(height: 15)
                    Divider()
                        .frame(width: 350)
                        .background(Color.gray)
                    Spacer().frame(height: 15)
                    secondaryStats
                        .frame(width: proxy.size.width)
                    Spacer().frame(height: 15)
                    paletteRow
                    Spacer().frame(height: 20)
                    customTabs
                    Spacer().frame(height: 15)
                    tabContent
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    //                    Spacer()
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
    
    var topAppBar: some View {
        HStack(alignment: .center) {
            Image(.imgLogo)
                .renderingMode(.template)
                .font(.title)
                .foregroundStyle(Color("TextColor"))
                .padding(.leading, 20)
            Spacer()
            userProfileIcon
                .navigationDestination(isPresented: $isNavigatingToImageScreen) {
                    ImageScreen()
                }
            Spacer().frame(width: 40)
            Button(action: { isNavigatingToOtherScreen = true }) {
                Image(.icPlus)
                    .renderingMode(.template)
                    .foregroundStyle(Color("TextColor"))
                    .font(.title)
            }
            .navigationDestination(isPresented: $isNavigatingToOtherScreen) {
                TextScreen()
            }
            Spacer().frame(width: 35)
            Button(action: { isNavigatingToButtonScreen = true }) {
                Image(.icNavbar)
                    .renderingMode(.template)
                    .font(.title)
                    .padding(.trailing, 35)
                    .foregroundStyle(Color("TextColor"))
            }
            .navigationDestination(isPresented: $isNavigatingToButtonScreen) {
                ButtonScreen()
            }
        }
    }
    
    var userProfileIcon: some View {
        Button(action: { isNavigatingToImageScreen = true }) {
            ZStack {
                Color(red: 217 / 255, green: 0 / 255, blue: 52 / 255)
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.white)
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
        }
    }

    
    var profileHeader: some View {
        HStack(alignment: .center) {
            Spacer().frame(width: 40)
            Button(action: {}) {
                VStack {
                    Image(.icUpload)
                        .renderingMode(.template)
                        .foregroundStyle(Color("TextColor"))
                    Text("Upload")
                        .font(.custom("BarlowCondensed-Thin", size: UIFont.labelFontSize)) // Use system's default size
                        .fontWeight(.thin)
                        .foregroundColor(Color("LightBlue"))
                }.padding(.leading, 10)
            }
            Spacer()
            Image(.imgJohnDoe)
                .resizable()
                .foregroundStyle(Color.white)
                .frame(width: 120, height: 120)
            Spacer()
            Button(action: {}) {
                VStack {
                    Image(.icWrite)
                        .renderingMode(.template)
                        .foregroundStyle(Color("TextColor"))
                    Text("Edit")
                        .font(.custom("BarlowCondensed-Thin", size: UIFont.labelFontSize))
                        .fontWeight(.thin)
                        .foregroundStyle(Color("LightBlue"))
                }
            }
            Spacer().frame(width: 40)
        }
    }
    
    var dashboardRow : some View {
        HStack {
            Text("My dashboard")
                .font(.custom("BarlowCondensed-Thin", size: UIFont.labelFontSize))
                .fontWeight(.thin)
            Spacer()
            Toggle("", isOn: $isOn)
                .padding(.trailing, 20)
        }
    }
    
    var primaryStats: some View {
        HStack(alignment: .center) {
            VStack {
                Text("2.3K")
                    .font(.custom("BarlowCondensed-Regular",  size: 24))
                Text("Followers")
                    .font(.custom("BarlowCondensed-Thin", size: UIFont.labelFontSize))
                    .fontWeight(.thin)
            }
            Spacer().frame(width: 40)
            VStack {
                Text("50")
                    .font(.custom("BarlowCondensed-Regular", size: 24))
                Text("Artworks")
                    .font(.custom("BarlowCondensed-Thin", size: UIFont.labelFontSize))
                    .fontWeight(.thin)
            }
            Spacer().frame(width: 40)
            VStack {
                Text("21")
                    .font(.custom("BarlowCondensed-Regular",  size: 24))
                Text("Exhibitions")
                    .font(.custom("BarlowCondensed-Thin", size: UIFont.labelFontSize))
                    .fontWeight(.thin)
            }
        }
    }
    
    var secondaryStats: some View {
        HStack {
            HStack {
                Image(.icHeart)
                Text("120")
                    .font(.custom("Barlow-Thin", size: UIFont.labelFontSize))
                    .fontWeight(.thin)
            }
            Spacer().frame(width: 10)
            HStack {
                Image(.icSelect)
                Text("43K")
                    .font(.custom("Barlow-Thin", size: UIFont.labelFontSize))
                    .fontWeight(.thin)
            }
            Spacer().frame(width: 10)
            HStack {
                Image(.icShare)
                    .renderingMode(.template)
                    .foregroundStyle(Color("TextColor"))
                Text("2.3K")
                    .font(.custom("Barlow-Thin", size: UIFont.labelFontSize))
                    .fontWeight(.thin)
            }
        }
    }
    
    var paletteRow: some View {
        ZStack(alignment: .leading) {
            Image(.imgPalette)
            Text("palette")
                .font(.custom("BarlowCondensed-Regular", size: UIFont.labelFontSize))
                .foregroundStyle(Color.white)
                .padding(.leading, 10)
        }
    }
    
    var customTabs: some View {
        HStack {
            Spacer().frame(width: 30)
            Button(action: { tabContentText = "Uploads" }) {
                VStack {
                    Image(.icUpload)
                        .renderingMode(.template)
                        .foregroundStyle(Color("TextColor"))
                    Text("Uploads")
                        .font(.custom("Barlow-Regular", size: UIFont.labelFontSize))
                        .foregroundStyle(Color("TextColor"))
                }
            }
            Spacer()
            Button(action: { tabContentText = "Exhibitions" }) {
                VStack {
                    Image(.icExhibitions)
                        .renderingMode(.template)
                        .foregroundStyle(Color("TextColor"))
                    Text("Exhibitions")
                        .foregroundStyle(Color("TextColor"))
                        .font(.custom("Barlow-Regular", size: UIFont.labelFontSize))
                }
            }
            Spacer()
            Button(action: { tabContentText = "Revenue" }) {
                VStack {
                    Image(.icRevenue)
                        .renderingMode(.template)
                        .foregroundStyle(Color("TextColor"))
                    Text("Revenue")
                        .font(.custom("Barlow-Regular", size: UIFont.labelFontSize))
                        .foregroundStyle(Color("TextColor"))
                    //                        .fontWeight(.regular)
                }
            }
            Spacer().frame(width: 30)
        }
    }
    
    var tabContent: some View {
        ZStack(alignment: .center) {
            Text(tabContentText)
                .font(.custom("Barlow-Regular", size: UIFont.labelFontSize))
        }
    }
    
}
#Preview {
    ContentView()
}
