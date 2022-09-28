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
    
    var formattedMarketPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if let marketPriceString = formatter.string(from: marketPrice as NSNumber) {
            return marketPriceString
        } else {
            return "Error"
        }
    }
    
    var formattedCustomerPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if let priceString = formatter.string(from: customerPrice as NSNumber) {
            return priceString
        } else {
            return "Error"
        }
    }
}
