//
//  ProfileModel.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 10/1/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import Foundation

struct ProfileLocation: Codable {
    let country: String?
    let state: String?
    let city: String?
}

struct ProfileAvatar: Codable {
    let imageUrl: String?
    let width: Int?
    let height: Int?
}

// MARK: Profile

struct Profile: Codable {
    let firstName: String?
    let lastName: String?
    let location: ProfileLocation?
    let avatar: ProfileAvatar?
}

extension Profile {
    
    var fullName: String {
        
        if let firstName = firstName, let lastName = lastName {
            return "\(firstName) \(lastName)"
        } else if let firstName = firstName {
            return "\(firstName)"
        } else if let lastName = lastName {
            return "\(lastName)"
        } else {
            return "Name Lastname"
        }
    }
    
    var address: String {
        
        if let city = location?.city, let country = location?.country {
            return "\(city), \(country)"
        } else if let city = location?.city {
            return "\(city)"
        } else if let country = location?.country {
            return "\(country)"
        } else {
            return "City, Country"
        }
    }
    
    var avatarStrUrl: String {
        
        if let strUrl = avatar?.imageUrl {
            return strUrl
        } else {
            return String()
        }
        
    }
    
}

