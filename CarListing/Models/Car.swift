//
//  Car.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import Foundation

struct Car: Codable, Identifiable {
    let id = UUID()
    let consList: [String]
    let customerPrice: Double
    let make: String
    let marketPrice: Double
    let model: String
    let prosList: [String]
    let rating: Int
}
