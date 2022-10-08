//
//  CarModel.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import Foundation

class CarModel: ObservableObject {
    @Published var cars: [Car] = [Car]()
    @Published var selectedCar: UUID?
    
    var maxPrice: Double {
        var maxPrice = 0.0
        
        // Find Max Price
        for car in cars {
            if car.marketPrice > maxPrice {
                maxPrice = car.marketPrice
            }
        }
        
        return maxPrice
    }
    var maxPriceString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if let priceString = formatter.string(from: maxPrice as NSNumber) {
            return priceString
        } else {
            return "Error"
        }
    }
    var minPrice: Double {
        var minPrice = 0.0
        
        for car in cars {
            if car.marketPrice < minPrice {
                minPrice = car.marketPrice
            }
        }
        
        return minPrice
    }
    var minPriceString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if let priceString = formatter.string(from: minPrice as NSNumber) {
            return priceString
        } else {
            return "Error"
        }
    }
    
    var selectedRating: Int?
    
    init() {
        parseJSON()
        
        selectedCar = cars[0].id
    }
    
    func parseJSON(){
        // Get path to JSON file
        guard let path = Bundle.main.path(forResource: "car_list", ofType: ".json") else {
            print("Error getting json path")
            return
        }
        
        // Create a URL
        let url = URL(filePath: path)
        
        do {
            // Create data from that url
            let data = try Data(contentsOf: url)
            
            // Create a decoder
            let decoder = JSONDecoder()
            do {
                // Decode the JSON
                self.cars = try decoder.decode([Car].self, from: data)
                
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        } catch {
            print("Error creating data from JSON: \(error.localizedDescription)")
        }
    }
}
