//
//  BienRepository.swift
//  ImmoAgency
//
//  Created by rahab ahcene on 18/11/2023.
//

import Foundation
class PropertyRepository: ObservableObject{
    static let shared = PropertyRepository()
    
    @Published var properties = [
        Property ( id: 1234 ,type: .appartment ,rooms:4,image:"appartement1",price: 100000),
        Property ( id: 456 ,type: .house ,rooms:4,image:"maison1",price: 120000),
        Property ( id: 7890 ,type: .house ,rooms:7,image:"maison2",price: 300000),
        Property ( id: 543 ,type: .appartment ,rooms:5,image:"appartement2",price: 110000),
        Property ( id: 876 ,type: .house ,rooms:5,image:"maison3",price: 140000),
    ]
    
    
}
