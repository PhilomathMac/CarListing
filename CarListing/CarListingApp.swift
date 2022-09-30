//
//  CarListingApp.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import SwiftUI

@main
struct CarListingApp: App {
    var body: some Scene {
        WindowGroup {
            CarListView()
                .environmentObject(CarModel())
        }
    }
}
