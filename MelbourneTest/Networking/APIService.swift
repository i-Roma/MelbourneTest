//
//  APIService.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 9/30/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import Foundation

class APIService {
    
    // MARK: Properties
    
    public static let shared = APIService()
    private let session = AppURLSession()
    
    // MARK: Initialization
    
    private init() {}
    
    // MARK: Method
    
    func reguest(_ method: Method, to futureUrl: String, with parameters: [String : Any]? = nil, completion: ResponseData?) {
        
        let url = URL(string: futureUrl)!
        var request = URLRequest(url: url)
        
        switch method {
        case .get:
            request.httpMethod = method.rawValue
            
            if let parameters = parameters {
                
                var urlComponents = URLComponents(string: futureUrl)!
                urlComponents.queryItems = parameters.map { (arg) -> URLQueryItem in
                    let (key, value) = arg
                    return URLQueryItem(name: key, value: value as? String)
                }
                urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
                request = URLRequest(url: urlComponents.url!)
            }
            
        case .post:
            request.httpMethod = method.rawValue
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            
            if let parameters = parameters {
                let data = try! JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = data
            }
        }
        
        session.urlSession.dataTask(with: request) { data, response, error in
            
            if let mimeType = response?.mimeType, mimeType == "application/json", let data = data {
                completion?(.success(data))
            } else if let error = error {
                completion?(.failure(error))
            }
            
        }.resume()
    }
    
}
