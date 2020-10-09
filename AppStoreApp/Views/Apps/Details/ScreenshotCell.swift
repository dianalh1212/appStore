//
//  ScreenshotCell.swift
//  AppStoreApp
//
//  Created by hui liu on 9/23/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class ScreenshotCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        imageView.backgroundColor = .purple
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
