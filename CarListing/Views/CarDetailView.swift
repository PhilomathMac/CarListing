//
//  CarDetailView.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/28/22.
//
import SwiftUI

struct CarDetailView: View {
    
    let car: Car
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Pros:")
                .font(.caption)
                .bold()
            ForEach(car.prosList, id: \.self) { pro in
                Text("• \(pro)")
                    .font(.caption)
            }
            Text("Cons:")
                .font(.caption)
                .bold()
                .padding(.top, 10)
            ForEach(car.consList, id: \.self) { con in
                Text("• \(con)")
                    .font(.caption)
            }
        }
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(car: Car(consList: ["Bad direction"], customerPrice: 120000.0, make: "Land Rover", marketPrice: 125000.0, model: "Range Rover", prosList: ["You can go everywhere", "Good sound system"], rating: 3))
    }
}
