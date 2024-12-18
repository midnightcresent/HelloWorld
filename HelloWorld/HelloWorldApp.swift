//
//  HelloWorldApp.swift
//  HelloWorld
//
//  Created by Aditya on 15/12/24.
//

import SwiftUI

@main
struct HelloWorldApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
//    init(){
//        for family in UIFont.familyNames {
//             print(family)
//
//             for names in UIFont.fontNames(forFamilyName: family){
//             print("== \(names)")
//             }
//        }
//    }
    
    var body: some Scene {
        WindowGroup {
            Test()
        }
    }
}
