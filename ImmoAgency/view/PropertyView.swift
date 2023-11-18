//
//  PropertyView.swift
//  ImmoAgency
//
//  Created by rahab ahcene on 18/11/2023.
//

import SwiftUI

struct PropertyView: View {
    @State private var isDetailViewPresented: Bool = false
    @Binding var property: Property
    
    var body: some View {
        HStack {
            Image(property.image)
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .padding(8)
            
            VStack(alignment: .leading) {
                Text("Property  \(property.id)")
                Text("\(property.type)  \(property.rooms) rooms")
                Text("€ \(property.price) ")
                
            }
            NavigationLink(
                destination: PropertyDetailView(property: property),
                isActive: $isDetailViewPresented,
                label: {
                    EmptyView()
                }
            )
            .hidden()
        }
        .onTapGesture {
                    // Activez la navigation vers PropertyDetailView
                    isDetailViewPresented = true
                }
        
    }
}



struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        // Créez une instance de Property pour la prévisualisation
        let sampleProperty = Property(id: 1, type: "House", rooms: 3, image: "maison1", price: 500000)
        
        return PropertyView(property: .constant(sampleProperty))
            .previewDisplayName("Property View")
    }
}

