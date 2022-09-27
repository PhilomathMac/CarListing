//
//  CarListView.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 9/27/22.
//

import SwiftUI

struct CarListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
    }
}
