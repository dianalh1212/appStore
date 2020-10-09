//
//  AppPageHeader.swift
//  AppStoreApp
//
//  Created by hui liu on 9/8/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class AppPageHeader: UICollectionReusableView {
    
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

