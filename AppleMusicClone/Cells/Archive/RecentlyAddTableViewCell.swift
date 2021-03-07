//
//  RecentlyAddTableViewCell.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/03/06.
//

import UIKit

class RecentlyAddTableViewCell: UITableViewCell {

    @IBOutlet var recentCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recentCollectionView.delegate = self
        recentCollectionView.dataSource = self
        
        let nibName = UINib(nibName: "RecentlyAddCollectionViewCell", bundle: nil)
        recentCollectionView.register(nibName, forCellWithReuseIdentifier: "RecentlyAddCollectionViewCell")
    }

}

extension RecentlyAddTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentlyAddCollectionViewCell", for: indexPath) as! RecentlyAddCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = (screenWidth - 60) / 2
        return CGSize(width: cellWidth, height: cellWidth + 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
}
