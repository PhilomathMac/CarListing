//
//  FilterView.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 10/4/22.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var model: CarModel
    
    var body: some View {
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Filter Options")
                    .font(.title)
                FilterByMakeModel(userText: "")
                Divider()
                FilterByPriceView(sliderValue: Float(model.maxPrice))
                Divider()
                FilterByRatingView(chosenRating: 1)
            }
            .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
            .environmentObject(CarModel())
    }
}
