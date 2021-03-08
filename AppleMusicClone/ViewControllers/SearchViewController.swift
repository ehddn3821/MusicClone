//
//  SearchViewController.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/03/08.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "아티스트, 노래, 가사 등"
        self.navigationItem.searchController = searchController
        
        let nibName = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        searchCollectionView.register(nibName, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
    }

}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = (screenWidth - 51) / 2
        return CGSize(width: cellWidth, height: cellWidth * 0.65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }
}
