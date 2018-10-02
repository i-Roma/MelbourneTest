//
//  ProfileAPI.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 9/30/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import Foundation

class ProfileAPI {

    // MARK: Properties
    
    private static let profilePath = "profile.json"
    private let configuredUrl = APIConst.baseUrl + APIConst.mobileTestPath + profilePath
    
    // MARK: Profile response handler
    
    typealias ProfileHandler = (_ profile: Profile?, _ error: String?) -> ()
    
    // MARK: Get request to receive profile
    
    public func receive(completion: ProfileHandler?) {
        
        APIService.shared.reguest(.get, to: configuredUrl) { response in
            
            switch response {
            case .success(let data):
                
                let profile = try? JSONDecoder().decode(Profile.self, from: data)
                completion?(profile, nil)
                
            case .failure(let error):
                
                print(#function, error)
                completion?(nil, error.localizedDescription)
            }
        }
    }
    
}
