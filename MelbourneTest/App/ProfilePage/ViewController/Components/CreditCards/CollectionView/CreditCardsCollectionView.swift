//
//  CreditCardsCollectionView.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 10/2/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import UIKit

class CreditCardsCollectionView: UICollectionView {

    // MARK: Property
    
    private let cellScaling: CGFloat = 0.7
    
    // MARK: Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        settings()
    }
    
    // MARK: Methods
    
    private func settings() {
        becomeDelegate()
        setupUI()
        registerCell()
    }
    
    private func registerCell() {
        // Register cell
        self.register(CreditCardsCollectionViewCell.self, forCellWithReuseIdentifier: CreditCardsCollectionViewCell.reuseIdentifier)
    }
    
    // MARK: UI settings
    
    private func setupUI() {
        backgroundColor = AppColor.paleGrey
        
        let cellWidth = floor(bounds.width * cellScaling)
        let cellHeight = floor(bounds.height * cellScaling)
        
        let insetX = (bounds.width - cellWidth) / 2.0
        let insetY = (bounds.height - cellHeight) / 2.0
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        }
        contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
    }
    
}

// MARK: Delegate methods

extension CreditCardsCollectionView: UICollectionViewDelegate {
    
    private func becomeDelegate() {
        delegate = self
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
