//
//  RecommendTableViewCell.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/03/02.
//

import UIKit

class RecommendTableViewCell: UITableViewCell {

    @IBOutlet var rcmCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rcmCollectionView.delegate = self
        rcmCollectionView.dataSource = self
        
        let nibName = UINib(nibName: "RecommendCollectionViewCell", bundle: nil)
        rcmCollectionView.register(nibName, forCellWithReuseIdentifier: "RecommendCollectionViewCell")
        
        rcmCollectionView.decelerationRate = .fast
    }
}

extension RecommendTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RecommendTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width - 40
        
        return CGSize(width: screenWidth, height: screenWidth * 0.77)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
//        guard let layout = self.rcmCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        let cellWidthIncludingSpacing = UIScreen.main.bounds.width - 30
        
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
        let index: Int
        if velocity.x > 0 {
            index = Int(ceil(estimatedIndex))
        } else if velocity.x < 0 {
            index = Int(floor(estimatedIndex))
        } else {
            index = Int(round(estimatedIndex))
        }
        
        targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
    }
}
