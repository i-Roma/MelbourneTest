//
//  CreditCardsAPI.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 10/2/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import Foundation

class CreditCardsAPI {
    
    // MARK: Properties
    
    private static let profilePath = "cards.json"
    private let configuredUrl = APIConst.baseUrl + APIConst.mobileTestPath + profilePath
    
    // MARK: Profile response handler
    
    typealias CreditCardsHandler = (_ profile: CreditCards?, _ error: String?) -> ()
    
    // MARK: Get request to receive profile
    
    public func receive(completion: CreditCardsHandler?) {
        
        APIService.shared.reguest(.get, to: configuredUrl) { response in
            
            switch response {
            case .success(let data):
                
                let creditCards = try? JSONDecoder().decode(CreditCards.self, from: data)
                completion?(creditCards, nil)
                
            case .failure(let error):
                
                print(#function, error)
                completion?(nil, error.localizedDescription)
            }
        }
    }
    
}
