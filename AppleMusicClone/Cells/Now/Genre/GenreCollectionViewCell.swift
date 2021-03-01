//
//  GenreCollectionViewCell.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/02/23.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet var albumImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        albumImage.layer.cornerRadius = 10
    }

}
