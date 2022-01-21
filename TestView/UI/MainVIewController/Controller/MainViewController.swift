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
    var regions: [String] = ["台北","台中","高雄"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupDataSource()
        
        initView()
    }
    
    private func setupDelegate() {
        mainView.collectionView.delegate = self
    }
    
    private func setupDataSource() {
        mainView.collectionView.dataSource = self
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
