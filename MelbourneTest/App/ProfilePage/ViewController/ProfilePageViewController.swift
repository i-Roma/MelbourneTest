//
//  ProfilePageViewController.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 9/30/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var profileInfoView: ProfileInfoView!

    // MARK: Properties
    
    private let profileAPI = ProfileAPI()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        receiveProfileInfo()
        profileInfoView.delegate = self
    }
    
    // MARK: Networks call
    
    private func receiveProfileInfo() {
        profileAPI.receive { profile, error in
            
            if let error = error {
                self.showAlert(message: error)
            }
            
            if let profile = profile {
                print(#function, "->", profile as Any)
                
                DispatchQueue.main.sync {
                    self.setupProfileInfoView(profile)
                }
                
            }
        }
    }
    
    // MARK: Data to profile info view
    
    private func setupProfileInfoView(_ profile: Profile) {
        profileInfoView.fullName?.text = profile.fullName
        profileInfoView.location?.text = profile.address
        profileInfoView.avatar.downloaded(from: profile.avatarStrUrl, contentMode: .scaleAspectFit, placeholder: UIImage(named: "photoTemplate"))
    }

}

extension ProfilePageViewController: ProfileInfoViewDelegate {
    
    func settingsButtonDidTap() {
        showAlert(message: "Settings button action")
    }
    
    func mobileButtonDidTap() {
        showAlert(message: "Mobile button action")
    }
    
}
