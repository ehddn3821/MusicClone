//
//  BrowseViewController.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/03/01.
//

import UIKit

class BrowseViewController: UIViewController {

    @IBOutlet var browseTableView: UITableView!
    @IBOutlet var albumArtImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        browseTableView.delegate = self
        browseTableView.dataSource = self
        
        let rcmNibName = UINib(nibName: "RecommendTableViewCell", bundle: nil)
        browseTableView.register(rcmNibName, forCellReuseIdentifier: "RecommendTableViewCell")
        let genNibName = UINib(nibName: "GenreTableViewCell", bundle: nil)
        browseTableView.register(genNibName, forCellReuseIdentifier: "GenreTableViewCell")

        albumArtImageView.layer.shadowOpacity = 0.1
        albumArtImageView.layer.shadowOffset = CGSize(width: 0, height: 3)
        albumArtImageView.layer.shadowRadius = 5
        albumArtImageView.layer.masksToBounds = false
    }

}

// MARK: - UITableViewDelegate, DataSource
extension BrowseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendTableViewCell", for: indexPath) as! RecommendTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenreTableViewCell", for: indexPath) as! GenreTableViewCell
            cell.titleLabel.text = "언제 들어도 좋은 노래"
            return cell
        }
    }
}
