//
//  UIView+RoundedCorners.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 10/2/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import UIKit

extension UIView {
    
    func toCircle() {
        layer.cornerRadius = self.bounds.height / 2
        self.clipsToBounds = true
    }
    
}
