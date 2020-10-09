//
//  AppHorizontalSnappingController.swift
//  AppStoreApp
//
//  Created by hui liu on 9/21/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class AppHorizontalSnappingController: UICollectionViewController {
    init() {
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


