//
//  SongTableViewCell.swift
//  Picker
//
//  Created by KAUSHIKESWAR REDDY PALLE VENKATA on 8/8/18.
//  Copyright © 2018 KAUSHIKESWAR REDDY PALLE VENKATA. All rights reserved.
//

import UIKit

final class SongListTableViewCell: UITableViewCell {
    enum Constants {
        static let edgeOffset: CGFloat = 15
        static let titleLeadingOffset: CGFloat = 30
    }
    
    static let identifier = "songListTableViewCell"
    let title = UILabel()
    let selectionIcon = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        // Change checkmark image depending upon selected value
        selectionIcon.image = selected ? #imageLiteral(resourceName: "selected") : #imageLiteral(resourceName: "unselected")
    }
    
    func configureView() {
        selectionStyle = .none
        backgroundColor = .clear
        
        // Checkmark icon
        selectionIcon.contentMode = .scaleAspectFit
        selectionIcon.clipsToBounds = true
        selectionIcon.image = #imageLiteral(resourceName: "unselected")
        contentView.addAutoLayoutSubview(selectionIcon)
        selectionIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.edgeOffset).isActive = true
        selectionIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        // Title Label
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
        title.textAlignment = .center
        title.text = "Song"
        contentView.addAutoLayoutSubview(title)
        title.textAlignment = .left
        title.textColor = Color.bodyText
        title.leadingAnchor.constraint(equalTo: selectionIcon.trailingAnchor, constant: Constants.titleLeadingOffset).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.edgeOffset).isActive = true
        title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
