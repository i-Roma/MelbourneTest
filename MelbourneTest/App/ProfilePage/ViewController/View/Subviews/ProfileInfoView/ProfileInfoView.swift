//
//  ProfileInfoView.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 9/30/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import UIKit

protocol ProfileInfoViewDelegate: class {
    func settingsButtonDidTap()
    func mobileButtonDidTap()
}

class ProfileInfoView: UIView {
    
    // MARK: Delegate
    
    weak var delegate: ProfileInfoViewDelegate?
    
    // MARK: IBOutlets
    
    @IBOutlet weak var fullName: UILabel! {
        didSet {
            fullName.font = UIFont(name: Font.poppins.semiBold, size: 18)
            fullName.textColor = AppColor.darkGreyBlue
        }
    }
    
    @IBOutlet weak var location: UILabel! {
        didSet {
            location.font = UIFont(name: Font.poppins.light, size: 14)
            location.textColor = AppColor.darkGreyBlue
        }
    }
    
    @IBOutlet weak var avatar: UIImageView! {
        didSet {
            avatar.toCircle()
        }
    }
    
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var mobileButton: UIButton!
    
    // MARK: Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: IBActions

    @IBAction func settingsButtonAction(_ sender: UIButton) {
        print(#function)
        delegate?.settingsButtonDidTap()
    }
    
    @IBAction func mobileButtonAction(_ sender: UIButton) {
        print(#function)
        delegate?.mobileButtonDidTap()
    }
    
}
