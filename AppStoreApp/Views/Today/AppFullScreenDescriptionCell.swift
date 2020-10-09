//
//  AppFullScreenDescriptionCell.swift
//  AppStoreApp
//
//  Created by hui liu on 10/7/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class AppFullScreenDescriptionCell: UITableViewCell {
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "DESC"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(padding: .init(top: 0, left: 24, bottom: 2, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
