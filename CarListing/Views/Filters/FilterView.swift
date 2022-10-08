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
                HStack {
                    Text("Filter Options")
                        .font(.title)
                    Spacer()
                    Button {
                        model.resetFilters()
                    } label: {
                        Text("Reset Filters")
                    }

                }
                FilterByMakeModel(userText: model.filterText ?? "")
                Divider()
                FilterByPriceView(sliderValue: Float(model.userMaxPrice ?? model.maxPrice))
                Divider()
                FilterByRatingView(chosenRating: model.userMinRating ?? 1)
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
