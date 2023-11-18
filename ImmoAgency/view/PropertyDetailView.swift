//
//  PropertyDetailUIView.swift
//  ImmoAgency
//
//  Created by rahab ahcene on 18/11/2023.
//

import SwiftUI

struct PropertyDetailView: View {
    @State private var editedTypeIndex: Int
    @State private var editedRooms: String
    @State private var editedPrice: String
    
    let property: Property
    
    private let typeOptions = ["House", "Appartement"]
    
    init(property: Property) {
        self.property = property
        
        _editedTypeIndex = State(initialValue: typeOptions.firstIndex(of: property.type) ?? 0)
        _editedRooms = State(initialValue: "\(property.rooms)")
        _editedPrice = State(initialValue: "\(property.price)")
    }
    
    var body: some View {
        HStack {
            
            Text("Rooms:")
            TextField("", text: $editedRooms)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            Text("Prix:")
            TextField("", text: $editedPrice)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            Image(property.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
            
            
        }
    }
}



struct PropertyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Créez une instance de Property pour la prévisualisation
        let previewProperty = Property(id: 1, type: "House", rooms: 3, image: "maison1", price: 250000)

        // Utilisez cette instance pour initialiser PropertyDetailView
        PropertyDetailView(property: previewProperty)
    }
}

