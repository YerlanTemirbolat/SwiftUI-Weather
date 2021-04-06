//
//  SwiftUI_Weather.swift
//  SwiftUI-Weather
//
//  Created by Sean Allen on 4/5/21.
//

import SwiftUI

@main
struct SwiftUI_Weather: App {
    var body: some Scene {
        WindowGroup {
            ContentView(cityVM: CityViewViewModel(), city: "", date: "")
        }
    }
}
