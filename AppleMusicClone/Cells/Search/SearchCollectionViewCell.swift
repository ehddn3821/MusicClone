//
//  SearchCollectionViewCell.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/03/08.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let screenWidth = UIScreen.main.bounds.width
        let imageWidth = (screenWidth - 51) / 2
        
        let searchImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageWidth, height: imageWidth * 0.65))
        searchImageView.image = UIImage(named: "album1")
        searchImageView.layer.masksToBounds = true
        searchImageView.layer.cornerRadius = 10
        
        self.contentView.addSubview(searchImageView)
        
        let imageHeight = searchImageView.frame.height
        
        let searchLabel = UILabel(frame: CGRect(x: 10, y: imageHeight - 35, width: imageWidth, height: 30))
        
        searchLabel.text = "일렉트로닉"
        searchLabel.textColor = .white
        searchLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        
        self.contentView.addSubview(searchLabel)
    }

}
