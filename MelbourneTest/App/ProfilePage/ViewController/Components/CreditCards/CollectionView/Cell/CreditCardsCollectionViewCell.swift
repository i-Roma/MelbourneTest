//
//  CreditCardsCollectionViewCell.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 10/1/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import UIKit

class CreditCardsCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    public static let reuseIdentifier = String(describing: CreditCardsCollectionViewCell.classForCoder())
    public var creditCard = UIImageView()
    
    // MARK: Life cycle
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addImageView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setImageViewFrame()
        addShadow() 
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        creditCard.image = nil
    }
    
    // MARK: Methods
    
    private func addImageView() {
        creditCard.contentMode = .scaleAspectFill
        addSubview(creditCard)
    }
    
    private func setImageViewFrame() {
        let width = bounds.width * 0.94
        let height = bounds.height * 0.94
        let x = bounds.width / 2 - width / 2
        let y = bounds.height / 2 - height / 2
        creditCard.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    /// Shadow
    
    func addShadow() {
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 5, height: 10)
    }
    
}
