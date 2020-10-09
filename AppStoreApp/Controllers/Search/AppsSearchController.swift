//
//  AppsSearchController.swift
//  AppStoreApp
//
//  Created by hui liu on 8/12/20.
//  Copyright © 2020 hui liu. All rights reserved.
//


import UIKit
import SDWebImage

class AppsSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellID = "id1234"
    
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTTermLabel : UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appID = String(appResults[indexPath.item].trackId)
        let appDetailController = AppDetailController(appID: appID)
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.addSubview(enterSearchTTermLabel)
        enterSearchTTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
//        enterSearchTTermLabel.translatesAutoresizingMaskIntoConstraints = false
//        enterSearchTTermLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 100).isActive = true
//        enterSearchTTermLabel.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0).isActive = true
//        enterSearchTTermLabel.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 50).isActive = true
//        enterSearchTTermLabel.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: 50).isActive = true
        setupSearchBar()
        //fetchITunesApps()
    }
    
    
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // introduce some delay before perfoming the search
        
        var timer: Timer?
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            // this will fire my search
            Service.shared.fetchApps(searchString: searchText) { (res, err) in
                 print("6")
                if let err = err {
                    return
                }
                self.appResults = res?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    print("7")
                }
            }
        })
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        
        cell.appResult = appResults[indexPath.item]
        return cell
    }
    
    fileprivate var appResults = [Result]()
    
    fileprivate func fetchITunesApps() {
        print("5")
        //Service.shared.fetchApps(completion: <#T##([Result]) -> ()#>)
        Service.shared.fetchApps(searchString: "Twiiter") { (results, err) in
             print("6")
            if let err = err {
                return
            }
            self.appResults = results?.results ?? []
            DispatchQueue.main.async { 
                self.collectionView.reloadData()
                 print("7")
            }
        }
        print("8")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
}
