//
//  CarCard.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import SwiftUI

struct CarCard: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            GeometryReader { geo in
                HStack {
                    
                    Image("Tacoma")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width / 2, height: geo.size.height)
                        .clipped()
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Car Title")
                            .font(.title2)
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        Text("Car Price")
                            .font(.caption)
                            .italic()
                        Spacer()
                        RatingView()
                            .padding(.bottom, 10)
                       
                    }
                }
            }
        }
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
        .frame(height: 250)
    }
}

struct CarCard_Previews: PreviewProvider {
    static var previews: some View {
        CarCard()
    }
}
