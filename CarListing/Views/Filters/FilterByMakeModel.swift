//
//  FilterByMakeModel.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 10/7/22.
//

import SwiftUI

struct FilterByMakeModel: View {
    @State var userText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Car Make or Model:")
                .font(.callout)
                .bold()
                .padding(.vertical, 15)
            SearchBar(text: $userText)
            
        }
    }
}

struct FilterByMakeModel_Previews: PreviewProvider {
    static var previews: some View {
        FilterByMakeModel(userText: "")
    }
}
