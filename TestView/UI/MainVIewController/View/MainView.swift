//
//  MainView.swift
//  TableViewText
//
//  Created by Book on 2022/1/9.
//

import UIKit

class MainView: UIView {
    
    let fullScreenSize = UIScreen.main.bounds

    lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height), collectionViewLayout: layout)
        
        collectionView.backgroundColor = .white
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: fullScreenSize.width, height: fullScreenSize.height/4)
        
        return layout
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        configurationCellSize(width: fullScreenSize.width,
                              height: fullScreenSize.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        self.addSubview(self.collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    func configurationCellSize(width collectionViewWidth: CGFloat, height collectionViewHeight: CGFloat) {
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout

        layout?.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout?.minimumLineSpacing = 5
        layout?.itemSize = CGSize(width: collectionViewWidth, height: collectionViewHeight/4)
    }
    
    func updateFrame() {
        collectionView.reloadData()
    }
    
}
