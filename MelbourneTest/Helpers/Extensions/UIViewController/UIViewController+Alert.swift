//
//  UIViewController+Alert.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 10/1/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import UIKit

private struct Alert {
    static let title = "MelbourneTest"
    static let ok = "Ok"
}

extension UIViewController {
    
    func showAlert(title: String = Alert.title, message: String, okButtonTitle: String = Alert.ok) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }

}
