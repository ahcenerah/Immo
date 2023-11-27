//
//  Bien.swift
//  ImmoAgency
//
//  Created by rahab ahcene on 18/11/2023.
//

import Foundation
struct Property: Identifiable{
    var id : Int
    var type : PropertyType
    var rooms : Int
    var image: String
    var price: Int
}
enum PropertyType : CustomStringConvertible {
    var description: String{
        switch self {
        case .appartment : return "Appartment"
        case .house : return "House"
        }
    }
    
    case appartment , house
}
