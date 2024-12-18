//
//  Test.swift
//  HelloWorld
//
//  Created by Aditya on 18/12/24.
//

import SwiftUI

struct Test: View {
    init() {
        var user = User()
        user.name = "john doe"
        print(user.name) // Output: "John Doe"
    }

    var body: some View {
        Text("Testing property wrappers")
    }
    
}

@propertyWrapper
struct Capitalized {
    private var value: String = ""
    var wrappedValue: String {
        get { value }
        set { value = newValue.capitalized }
    }
}

struct User {
    @Capitalized var name: String
}
