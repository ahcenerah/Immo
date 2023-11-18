//
//  PropertiesView.swift
//  ImmoAgency
//
//  Created by rahab ahcene on 18/11/2023.
//

import SwiftUI

struct PropertiesView: View {

    @StateObject var repository = PropertyRepository.shared
    
   
    var body: some View {
            NavigationStack{
                List($repository.properties) { $property in
                    PropertyView(property: $property)
                }
                .navigationBarTitle("Real Estate")
            }
        
        }
}


struct PropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        PropertiesView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
