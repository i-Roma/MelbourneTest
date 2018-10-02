//
//  UIImageView+Download.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 10/2/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit, placeholder: UIImage? = nil) {
        self.image = placeholder
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {

                UIView.transition(
                    with: self,
                    duration: 0.5,
                    options: .transitionCrossDissolve,
                    animations: { self.image = image },
                    completion: nil
                )
            }
            
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit, placeholder: UIImage? = nil) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode, placeholder: placeholder)
    }
    
}
