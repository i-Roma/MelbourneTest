//
//  CreditCardsViewController.swift
//  MelbourneTest
//
//  Created by Roman Romanenko on 10/2/18.
//  Copyright © 2018 Roman. All rights reserved.
//

import UIKit

class CreditCardsViewController: UIViewController {

    // MARK: IBOutlet
    
    @IBOutlet weak var collectionView: CreditCardsCollectionView!
    
    // MARK: Properties
    
    private let creditCardsAPI = CreditCardsAPI()
    private var creditCards: CreditCards?
    private let activityView = UIActivityIndicatorView(style: .gray)
    private let fadeView: UIView = UIView()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegate
        collectionView.dataSource = self
        
        receiveCreditCards()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fadeView.frame = self.view.frame
        fadeView.backgroundColor = UIColor.white
        fadeView.alpha = 0.4
        self.view.addSubview(fadeView)
        self.view.addSubview(activityView)
        activityView.hidesWhenStopped = true
        activityView.center = self.view.center
        activityView.startAnimating()

    }
    
    // MARK: Networking call
    
    private func receiveCreditCards() {
        addActivityView()
        creditCardsAPI.receive { creditCards, error in
            
            DispatchQueue.main.async {
                self.removeActivityView()
            }
            
            if let error = error {
                self.showAlert(message: error)
            }
            
            if let creditCards = creditCards {
                self.creditCards = creditCards
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }

}

// MARK: Data source

extension CreditCardsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let numberOfItemsInSection = creditCards?.cards.count  else {
            return 0
        }
        return numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = CreditCardsCollectionViewCell.reuseIdentifier
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CreditCardsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let placeholderImage = UIImage(named: "whiteOpenpayCard")
        if let cardImgStrUrl = creditCards?.cards[indexPath.row].imageURL {

            cell.creditCard.downloaded(from: cardImgStrUrl, contentMode: .scaleAspectFill, placeholder: placeholderImage)
        } else {
            cell.creditCard.image = placeholderImage
        }
        
        return cell
    }
}

// Helpers

extension CreditCardsViewController {
    
    private func addActivityView() {
        fadeView.frame = self.view.frame
        fadeView.backgroundColor = UIColor.white
        fadeView.alpha = 0.4
        self.view.addSubview(fadeView)
        self.view.addSubview(activityView)
        activityView.hidesWhenStopped = true
        activityView.center = self.view.center
        activityView.startAnimating()
    }
    
    private func removeActivityView() {
        self.fadeView.removeFromSuperview()
        self.activityView.stopAnimating()
    }
    
}
