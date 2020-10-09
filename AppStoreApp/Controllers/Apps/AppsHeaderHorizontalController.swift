//
//  AppsHeaderHorizontalController.swift
//  AppStoreApp
//
//  Created by hui liu on 9/9/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class AppsHeaderHorizontalController: AppHorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    var socialApps = [SocialApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        // make  cell horiztoanl (delete once change base to snap VC)
//        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
//    //make left edge towards cell
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .init(top: 0, left: 16, bottom: 0, right: 16 )
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsHeaderCell
        let app = socialApps[indexPath.item]
        
        cell.companyLabel.text = app.name
        cell.titleLabel.text = app.tagline
        cell.iamgeView.sd_setImage(with: URL(string: app.imageUrl))
        return cell
    }
}
 
