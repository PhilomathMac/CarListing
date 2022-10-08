//
//  FilterByPriceView.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 10/7/22.
//

import SwiftUI

struct FilterByPriceView: View {
    @State var sliderValue: Float
    var chosenPriceString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if let priceString = formatter.string(from: sliderValue as NSNumber) {
            return priceString
        } else {
            return "Error"
        }
    }
    @EnvironmentObject var model: CarModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Max Price:")
                .font(.callout)
                .bold()
                .padding(.vertical, 10)
            
            Slider(value: $sliderValue, in: Float(model.minPrice)...Float(model.maxPrice)) {
                
            } minimumValueLabel: {
                Text("")
            } maximumValueLabel: {
                Text(chosenPriceString)
            }

    

        }
    }
}

struct FilterByPriceView_Previews: PreviewProvider {
    static var previews: some View {
        FilterByPriceView(sliderValue: 100.0)
            .environmentObject(CarModel())
    }
}
