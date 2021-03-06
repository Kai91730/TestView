//
//  UITableView.swift
//  TableViewText
//
//  Created by Kai on 2021/12/28.
//

import Foundation
import UIKit
import GoogleMaps

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            as? CustomTableViewCell {
            
            let coffeeShop = coffeeShops[indexPath.row]
            
            cell.updateFrame(coffeeShop: coffeeShop)
        
            return cell
            
        } else {
            
            print("generate cell failed!")
            return CustomTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeShops.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return region
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(" \(indexPath.row+1) pressed!")
        
        let mapVC = MapViewController()
        mapVC.address = coffeeShops[indexPath.row].address
        mapVC.shopName = coffeeShops[indexPath.row].name
        navigationController?.pushViewController(mapVC, animated: true)
    }
}
