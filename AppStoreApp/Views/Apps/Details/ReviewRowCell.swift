//
//  ReviewCell.swift
//  AppStoreApp
//
//  Created by hui liu on 9/25/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class  ReviewRowCell: UICollectionViewCell {
    
    let reviewController = ReviewController()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        addSubview(reviewController.view)
        reviewController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
