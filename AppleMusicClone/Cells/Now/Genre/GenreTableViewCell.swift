//
//  GenreTableViewCell.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/02/23.
//

import UIKit

class GenreTableViewCell: UITableViewCell {

    @IBOutlet var genreCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        
        let nibName = UINib(nibName: "GenreCollectionViewCell", bundle: nil)
        genreCollectionView.register(nibName, forCellWithReuseIdentifier: "GenreCollectionViewCell")
        
        
    }
    
}

// MARK: - UICollectionViewDelegate, DataSource
extension GenreTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = genreCollectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension GenreTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        
        return CGSize(width: screenWidth*0.43, height: screenWidth*0.55)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
