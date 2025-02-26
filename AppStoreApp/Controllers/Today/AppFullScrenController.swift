//
//  AppFullScrenController.swift
//  AppStoreApp
//
//  Created by hui liu on 10/7/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class AppFullScrenController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = TodayCell()
//        return header
//    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 450
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.item == 0 {
            //hack
//            let cell = UITableViewCell()
//            let todayCell = TodayCell()
//            cell.addSubview(todayCell)
//            todayCell.centerInSuperview(size: .init(width: 250, height: 250))
            
            return AppFullScreenHeaderCell()
        }
        
        let cell = AppFullScreenDescriptionCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 450
        }
        // let tableview automatic handle the description cells
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}
