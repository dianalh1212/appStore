//
//  AppDetailController.swift
//  AppStoreApp
//
//  Created by hui liu on 9/22/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    //dependency injection constructor
    
    fileprivate let appID: String
    
    init(appID: String) {
        self.appID = appID
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //dpendency
//    var appID: String! {
//        //The willSet and didSet observers for totalSteps are called whenever the property is assigned a new value. This is true even if the new value is the same as the current value.
//        didSet {
//
//        }
//    }
    
    var app: Result?
    var reviews: Reviews?
    let detailCellID = "detailCellID"
    let previewCellID = "previewCellID"
    let reviewCellID = "ReviewCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellID)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellID)
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewCellID)
        
        navigationItem.largeTitleDisplayMode = .never
        
        fetchData()
    }
    
    fileprivate func fetchData() {
        let urlString = "https://itunes.apple.com/lookup?id=\(appID)"
        Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, err) in
            if let err = err {
                return 
            }
            let app = result?.results.first
            self.app = app
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        let reviewURL = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appID)/sortby=mostrecent/json?l=en&cc=us"
        Service.shared.fetchGenericJSONData(urlString: reviewURL) { (reviews: Reviews?, err) in
            if let err = err {
                return
            }
            self.reviews = reviews
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellID, for: indexPath) as! AppDetailCell
            cell.app = app
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellID, for: indexPath) as! PreviewCell
            cell.horizontalController.app = self.app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellID, for: indexPath) as! ReviewRowCell
            cell.reviewController.reviews = self.reviews
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height: CGFloat = 280
        
        if indexPath.item == 0 {
            // let first row cell dynamic size
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.app = app
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
                height = estimatedSize.height
        } else if indexPath.item == 1 {
            height = 500
        } else {
            height = 280
        }
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
}
