//
//  TableView.swift
//  TestView
//
//  Created by Kai on 2022/1/10.
//

import UIKit

class DataView: UIView {

    let fullScreenSize = UIScreen.main.bounds

    lazy var activityIndicator = UIActivityIndicatorView(style: .large)

    lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height), style: UITableView.Style.plain)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return tableView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        self.addSubview(tableView)
        self.addSubview(self.activityIndicator)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func updateFrame() {
        tableView.reloadData()
    }
}
