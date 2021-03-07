//
//  ArchiveViewController.swift
//  AppleMusicClone
//
//  Created by dwKang on 2021/03/04.
//

import UIKit

class ArchiveViewController: UIViewController {

    @IBOutlet var archiveTableView: UITableView!
    
    var archiveList = ["플레이리스트", "아티스트", "앨범", "노래", "장르", "편집 앨범", "작곡가"]
    var archiveImageName = ["music.note.list", "music.mic", "square.stack", "music.note", "guitars", "person.2.square.stack", "music.quarternote.3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        archiveTableView.delegate = self
        archiveTableView.dataSource = self
        
        archiveTableView.rowHeight = UITableView.automaticDimension
        archiveTableView.estimatedRowHeight = 200
        
        let nibName = UINib(nibName: "ArchiveTableViewCell", bundle: nil)
        archiveTableView.register(nibName, forCellReuseIdentifier: "ArchiveTableViewCell")
        let recentNibName = UINib(nibName: "RecentlyAddTableViewCell", bundle: nil)
        archiveTableView.register(recentNibName, forCellReuseIdentifier: "RecentlyAddTableViewCell")
    }

}

extension ArchiveViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return archiveList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == archiveList.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentlyAddTableViewCell", for: indexPath)
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArchiveTableViewCell", for: indexPath) as! ArchiveTableViewCell
            cell.archiveImage.image = UIImage(systemName: archiveImageName[indexPath.row])
            cell.archiveLabel.text = archiveList[indexPath.row]
            cell.accessoryType = .disclosureIndicator
            
            return cell
        }
        
    }
    
}
