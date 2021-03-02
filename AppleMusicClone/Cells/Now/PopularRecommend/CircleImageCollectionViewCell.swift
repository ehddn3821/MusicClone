//
//  PopularRecommendCollectionViewCell.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/02/20.
//

import UIKit

class CircleImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet var mainView: UIView!
    @IBOutlet var albumBgView: UIView!
    @IBOutlet var albumArtImageView: UIImageView!
    @IBOutlet var footerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        albumBgView.clipsToBounds = true
        albumBgView.layer.cornerRadius = 10
        albumBgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        footerView.clipsToBounds = true
        footerView.layer.cornerRadius = 10
        footerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        albumArtImageView.clipsToBounds = true
        albumArtImageView.layer.cornerRadius = UIScreen.main.bounds.width / 4
        
    }

}
