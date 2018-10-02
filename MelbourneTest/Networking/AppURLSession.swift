//
//  AppURLSession.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 9/30/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import Foundation

class AppURLSession {
    
    // MARK: Properties
    
    public var urlSession: URLSession!
    
    // MARK: Initialization
    
    init() {
        urlSession = URLSession(configuration: .default)
    }
}
