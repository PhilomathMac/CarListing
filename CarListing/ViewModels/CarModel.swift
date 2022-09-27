//
//  CarModel.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import Foundation

class CarModel: ObservableObject {
    @Published var cars: [Car] = [Car]()
    
    init() {
        parseJSON()
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
