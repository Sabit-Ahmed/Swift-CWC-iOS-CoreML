//
//  Cat_or_Dog_App.swift
//  Cat or Dog?
//
//  Created by Sabit Ahmed on 8/11/21.
//

import SwiftUI

@main
struct Cat_or_Dog_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: AnimalModel())
        }
    }
}
