//
//  TestViewController.swift
//  TableViewText
//
//  Created by Kai on 2021/12/10.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    let mainView:MainView = MainView()
    var regions: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupDataSource()
        initVariable()
        initView()
    }
    
    private func setupDelegate() {
        mainView.collectionView.delegate = self
    }
    
    private func setupDataSource() {
        mainView.collectionView.dataSource = self
    }
    
    private func initVariable() {
        for region in Regions.allCases {
            regions.append(region.rawValue)
        }
    }
    
    private func initView() {
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        mainView.configurationCellSize(width: size.width, height: size.height)
    }
    
    
}
