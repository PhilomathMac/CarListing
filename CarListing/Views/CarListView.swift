//
//  CarListView.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import SwiftUI

struct CarListView: View {
    @EnvironmentObject var model: CarModel
    @State var isSearching: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(0..<model.cars.count, id: \.self) { num in
                        CarCard(car: model.cars[num])
                    }
                }
            }
            .navigationTitle(
                Text("CarList")
            )
            .navigationBarItems(trailing: Button(action: {
                isSearching.toggle()
            }, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
            }))
        }
        .sheet(isPresented: $isSearching) {
            FilterView()
                .presentationDetents([.medium])
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView(isSearching: false)
            .environmentObject(CarModel())
    }
}
