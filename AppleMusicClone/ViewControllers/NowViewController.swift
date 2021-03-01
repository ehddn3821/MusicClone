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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
