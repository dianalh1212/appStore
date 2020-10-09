//
//  AppsHeaderCell.swift
//  AppStoreApp
//
//  Created by hui liu on 9/9/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "fdfdfdfdf", font: .boldSystemFont(ofSize: 24))
    
    let iamgeView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.numberOfLines = 2
       
        let verticalStackView = UIStackView(arrangedSubviews: [companyLabel, titleLabel, iamgeView])
        verticalStackView.axis = .vertical
        
        verticalStackView.spacing = 12
        
        addSubview(verticalStackView)
        verticalStackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
