//
//  SquareCollectionViewCell.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/02/20.
//

import UIKit

class SquareCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var squareImageView: UIImageView!
    @IBOutlet weak var footerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        squareImageView.clipsToBounds = true
        squareImageView.layer.cornerRadius = 10
        squareImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        footerView.clipsToBounds = true
        footerView.layer.cornerRadius = 10
        footerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }

}
