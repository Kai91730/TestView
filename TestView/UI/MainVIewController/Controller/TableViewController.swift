//
//  TableViewController.swift
//  TestView
//
//  Created by Kai on 2022/1/10.
//

import UIKit
import SnapKit

class TableViewController: UIViewController {

    var region: String = ""
    var dataView: DataView = DataView()
    var coffeeShops:[CoffeeShopData] = []
    lazy var apiService: ApiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDelegate()
        setupDataSource()
        initView()
        getData()
    }
    
    private func setupDelegate() {
        dataView.tableView.delegate = self
    }
    
    private func setupDataSource() {
        dataView.tableView.dataSource = self
    }
    
    private func initView() {
        self.view.addSubview(dataView)
        dataView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func getData() {
        
//        dataView.activityIndicator.startAnimating()
        apiService.regionText = region
        apiService.getDataFromApi { [weak self] (coffeeDatas) in
   
            self?.coffeeShops = coffeeDatas
            
            DispatchQueue.main.async {
                self?.dataView.updateFrame()
//                self?.dataView.activityIndicator.stopAnimating()
            }
        }
    }
    
}
