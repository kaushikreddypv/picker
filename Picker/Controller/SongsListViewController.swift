//
//  ViewController.swift
//  Picker
//
//  Created by KAUSHIKESWAR REDDY PALLE VENKATA on 8/8/18.
//  Copyright © 2018 KAUSHIKESWAR REDDY PALLE VENKATA. All rights reserved.
//

import UIKit

final class SongsListViewController: UIViewController {
    
    enum Constants {
        static let leadingOffset: CGFloat = 15
        enum tableView {
            static let rowHeight: CGFloat = 52
            static let sectionHeight: CGFloat = 62
        }
    }
    
    private let tableView = UITableView()
    private lazy var songsManager = SongsManager()
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addAutoLayoutSubview(tableView)
        
        //Table View
        tableView.register(SongListTableViewCell.self, forCellReuseIdentifier: SongListTableViewCell.identifier)
        tableView.edgesToSuperview()
        tableView.allowsMultipleSelection = true
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        songsManager.fetchSongs()
    }
}

extension SongsListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category: SongCategory = songsManager.categoryList[section]
        return category.songs.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return songsManager.categoryList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Custom section header view with label
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: Constants.tableView.sectionHeight))
        headerView.backgroundColor = Color.sectionBackground
        let category: SongCategory = songsManager.categoryList[section]
        let title = UILabel()
        title.text = category.title
        title.textColor = Color.sectionHeader
        title.textAlignment = .left
        headerView.addAutoLayoutSubview(title)
        title.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: Constants.leadingOffset).isActive = true
        title.topAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return Constants.tableView.sectionHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongListTableViewCell.identifier) as! SongListTableViewCell
        let category: SongCategory = songsManager.categoryList[indexPath.section]
        cell.title.text = category.songs[indexPath.row].title
        return cell
    }
}

extension SongsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Call deselect on already selected cell
        let category: SongCategory = songsManager.categoryList[indexPath.section]
        let isSelected = category.songs[indexPath.row].isSelect
        defer {
            category.songs[indexPath.row].isSelect = !isSelected
        }
        guard !isSelected else {
         return tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}
