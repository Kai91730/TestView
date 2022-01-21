//
//  CollectionViewCell.swift
//  TableViewText
//
//  Created by Kai on 2022/1/4.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(image)
        return image
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(label)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstratints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstratints() {
        
        label.snp.makeConstraints { make in
            
            make.centerX.equalTo(self.contentView.center.x)
            make.centerY.equalTo(self.contentView.center.y)
        }
    }
}
