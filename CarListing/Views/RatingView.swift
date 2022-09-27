//
//  RatingView.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import SwiftUI

struct RatingView: View {
    var rating: Int
    var onColor = Color(.systemOrange)
    var offColor = Color(.systemGray)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Rating:")
                .font(.callout)
                .bold()
                .padding(.vertical, 5)
            HStack {
                ForEach(0 ..< 5, id: \.self) { num in
                    Image(systemName: "star.fill")
                        .foregroundColor(num < rating ? onColor : offColor)
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4)
    }
}
