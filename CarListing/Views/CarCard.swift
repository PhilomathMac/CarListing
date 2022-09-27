//
//  CarCard.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import SwiftUI

struct CarCard: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("Tacoma")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
            VStack(alignment: .leading) {
                Text("Car Name")
                    .bold()
                Text("Car Price")
                    .font(.caption)
                Text("Car Rating")
                    .padding(.top, 20)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
    }
}

struct CarCard_Previews: PreviewProvider {
    static var previews: some View {
        CarCard()
    }
}
