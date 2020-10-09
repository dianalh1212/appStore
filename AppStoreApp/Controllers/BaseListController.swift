//
//  BaseListController.swift
//  AppStoreApp
//
//  Created by hui liu on 8/27/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("fdfdfdf")
    }
}
