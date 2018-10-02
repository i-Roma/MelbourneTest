//
//  CreditCardsModel.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 10/2/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import Foundation

struct CreditCards: Codable {
    let cards: [CreditCard]
}

struct CreditCard: Codable {
    let imageURL: String
    let width, height: Int
    let isDefault: Bool
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case width, height, isDefault
    }
}
