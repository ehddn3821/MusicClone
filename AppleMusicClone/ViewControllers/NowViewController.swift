//
//  NowViewController.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/02/20.
//

import UIKit

class NowViewController: UIViewController {
    
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var albumArtImageView: UIImageView!
    
    let rightButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 오른쪽 아이템 추가
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
        rightButton.setImage(UIImage(systemName: "person.crop.circle", withConfiguration: largeConfig), for: .normal)
        navigationController?.navigationBar.addSubview(rightButton)
        rightButton.tag = 1
        rightButton.frame = CGRect(x: self.view.frame.width, y: 0, width: 50, height: 50)

        let targetView = self.navigationController?.navigationBar

        let trailingContraint = NSLayoutConstraint(item: rightButton, attribute:
            .trailingMargin, relatedBy: .equal, toItem: targetView,
                             attribute: .trailingMargin, multiplier: 1.0, constant: -16)
        let bottomConstraint = NSLayoutConstraint(item: rightButton, attribute: .bottom, relatedBy: .equal,
                                        toItem: targetView, attribute: .bottom, multiplier: 1.0, constant: -6)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([trailingContraint, bottomConstraint])
        // -------------------------------------------------------------------------------------------------------
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        //tableView separator 없애기
        mainTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        let popNibName = UINib(nibName: "PopularRecommendTableViewCell", bundle: nil)
        mainTableView.register(popNibName, forCellReuseIdentifier: "PopularRecommendTableViewCell")
        let genNibName = UINib(nibName: "GenreTableViewCell", bundle: nil)
        mainTableView.register(genNibName, forCellReuseIdentifier: "GenreTableViewCell")
        
        albumArtImageView.layer.shadowOpacity = 0.15
        albumArtImageView.layer.shadowOffset = CGSize(width: 0, height: 5)
        albumArtImageView.layer.shadowRadius = 10
        albumArtImageView.layer.masksToBounds = false
    }

}

extension NowViewController: UIScrollViewDelegate {
    // 네비게이션바 작아지면 rightButton 사라지게
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if mainTableView.contentOffset.y <= 0 {
            rightButton.isHidden = false
        } else {
            rightButton.isHidden = true
        }
    }
}

// MARK: - UITableViewDelegate, DataSource
extension NowViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularRecommendTableViewCell", for: indexPath) as! PopularRecommendTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenreTableViewCell", for: indexPath) as! GenreTableViewCell
            return cell
        }
    }
}
