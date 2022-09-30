//
//  CarCard.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import SwiftUI

struct CarCard: View {
    let car: Car
    @EnvironmentObject var model: CarModel
    
    @State var isExpanded: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            GeometryReader { geo in
                HStack {
                    
                    Image(car.make)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width / 2, height: geo.size.height)
                        .clipped()
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        // Car Name
                        Text("\(car.make) \(car.model)")
                            .font(.title2)
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        
                        // Car Price
                        Text(car.formattedMarketPrice)
                            .font(.caption)
                            .italic()
                            .padding(.bottom, 20)
                        
                        // Rating
                        RatingView(rating: car.rating)
                            .padding(.bottom, 10)
                        
                        // Details
                        if car.id == model.selectedCar {
                            CarDetailView(car: car)
                        }
                        Spacer()
                        
                        // Details Button
                        Button {
                            DispatchQueue.main.async {
                                withAnimation {
                                    
                                    if car.id == model.selectedCar {
                                        model.selectedCar = nil
                                    } else {
                                        model.selectedCar = car.id
                                    }
                                    
                                }
                            }
                        } label: {
                            Text(car.id == model.selectedCar ? "Hide Details" : "Show Details" )
                                .bold()
                                .padding(.bottom, 10)
                        }

                       
                    }
                }
            }
        }
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
        .frame(height: car.id == model.selectedCar ? 450 : 250)
    }
}

struct CarCard_Previews: PreviewProvider {
    static var previews: some View {
        CarCard(car: Car(consList: ["Bad direction"], customerPrice: 120000.0, make: "Land Rover", marketPrice: 125000.0, model: "Range Rover", prosList: ["You can go everywhere", "Good sound system"], rating: 3))
    }
}
