//
//  CarModel.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import Foundation

class CarModel: ObservableObject {
    var allCars: [Car] = [Car]()
    @Published var filterdCars: [Car] = [Car]()
    
    @Published var selectedCar: UUID?
    
    var maxPrice: Double {
        var maxPrice = 0.0
        
        // Find Max Price
        for car in allCars {
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
    
    var userMinRating: Int? {
        didSet {
            getCars()
        }
    }
    var userMaxPrice: Double? {
        didSet {
            getCars()
        }
    }
    var filterText: String? {
        didSet {
            getCars()
        }
    }
    
    init() {
        parseJSON()
        
        selectedCar = allCars[0].id
        filterdCars = allCars
    }
    
    func getCars() {
        var carsToShow = allCars
        if userMinRating != nil {
            carsToShow = carsToShow.filter({ $0.rating >= userMinRating! })
        }
        if userMaxPrice != nil {
            carsToShow = carsToShow.filter({ $0.marketPrice <= userMaxPrice! })
        }
        if filterText != nil {
            let cleanedText = filterText!.lowercased().trimmingCharacters(in: .newlines)
            let carsWithModel = carsToShow.filter({ $0.model.lowercased().contains(cleanedText)})
            let carsWithMake = carsToShow.filter({ $0.make.lowercased().contains(cleanedText)})
            carsToShow = carsWithMake + carsWithModel
        }
        filterdCars = carsToShow
    }
    
    func resetFilters() {
        userMinRating = nil
        userMaxPrice = nil
        filterText = nil
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
                self.allCars = try decoder.decode([Car].self, from: data)
                
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        } catch {
            print("Error creating data from JSON: \(error.localizedDescription)")
        }
    }
}
