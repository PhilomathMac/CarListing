//
//  CarListView.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import SwiftUI

struct CarListView: View {
    @ObservedObject var model = CarModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                HStack {
                    Text("CarListing")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .bold()
                        .foregroundColor(.orange)
                    Spacer()
                }
                .padding(20)
                
                    ForEach(1...5, id: \.self) { car in
                        CarCard()
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
    }
}
