//
//  SearchBar.swift
//  CarListing
//
//  Created by McKenzie Macdonald on 10/7/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    @EnvironmentObject var model: CarModel
    
       var body: some View {
           HStack {
    
               TextField("Rav4 or Toyota", text: $text)
                   .padding(7)
                   .padding(.horizontal, 25)
                   .background(Color(.systemGray6))
                   .cornerRadius(8)
                   .overlay(
                       HStack {
                           Image(systemName: "magnifyingglass")
                               .foregroundColor(.gray)
                               .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                               .padding(.leading, 8)
                    
                           if isEditing {
                               Button(action: {
                                   self.text = ""
                                   isEditing = false
                                   model.filterText = nil
                               }) {
                                   Image(systemName: "multiply.circle.fill")
                                       .foregroundColor(.gray)
                                       .padding(.trailing, 8)
                               }
                           }
                       }
                   )
                   .onTapGesture {
                       self.isEditing = true
                   }
                   .onSubmit {
                       model.filterText = text
                   }
                   .submitLabel(.search)
           }
       }
   }

struct SearchBar_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        SearchBar(text: $text)
            .environmentObject(CarModel())
    }
}
