//
//  UICollectionViewExtension.swift
//  TableViewText
//
//  Created by Kai on 2021/12/29.
//

import Foundation
import UIKit

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return regions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CustomCollectionViewCell {
            
            cell.backgroundColor = .orange
            cell.label.text = regions[indexPath.row]
            return cell
        } else {
            print("generate cell failed!")
            return CustomCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(regions[indexPath.row]) selected!")
        
        let tableViewVC = TableViewController()
        tableViewVC.region = regions[indexPath.row]
        navigationController?.pushViewController(tableViewVC, animated: true)
        
    }
    
}
