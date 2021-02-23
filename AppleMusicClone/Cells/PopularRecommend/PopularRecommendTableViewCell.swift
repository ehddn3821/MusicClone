//
//  PopularRecommendTableViewCell.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/02/20.
//

import UIKit

class PopularRecommendTableViewCell: UITableViewCell {

    @IBOutlet var myCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        let circleNibName = UINib(nibName: "CircleImageCollectionViewCell", bundle: nil)
        myCollectionView.register(circleNibName, forCellWithReuseIdentifier: "CircleCollectionViewCell")
        let squareNibName = UINib(nibName: "SquareCollectionViewCell", bundle: nil)
        myCollectionView.register(squareNibName, forCellWithReuseIdentifier: "SquareCollectionViewCell")
    }

}

// MARK: - UICollectionViewDelegate, DataSource
extension PopularRecommendTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            if let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CircleCollectionViewCell", for: indexPath) as? CircleImageCollectionViewCell {
                return cell
            }
        } else {
            if let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "SquareCollectionViewCell", for: indexPath) as? SquareCollectionViewCell {
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PopularRecommendTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        
        return CGSize(width: screenWidth*0.66, height: screenWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
