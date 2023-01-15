//
//  PhoneModel.swift
//  FinalAPI
//
//  Created by Dauletkhanova Saniya
//

import Foundation
import UIKit

struct PhoneModel: Decodable {
    let total: Int
    let skip: Int
    let limit: Int
    let products: [Products]
}

struct Products: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}




