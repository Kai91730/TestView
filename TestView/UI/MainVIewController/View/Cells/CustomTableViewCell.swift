//
//  CustomCell.swift
//  TableViewText
//
//  Created by Kai on 2021/12/21.
//

import Foundation
import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    let fullScreenSize = UIScreen.main.bounds
    let identifier = "CustomCell"
    
    lazy var nameLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(label)
        return label
    }()
    
    lazy var addressLabel: UILabel = {

        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        self.contentView.addSubview(label)
        return label
    }()

    lazy var descriptionLabel: UILabel = {

        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(label)
        return label
    }()
    
    lazy var openTimeLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        self.contentView.addSubview(label)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInitialView()
        setupConstratints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupInitialView() {
        self.selectionStyle = .blue
    }
    
    private func setupConstratints() {
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(self.contentView.snp.left).offset(20)
            make.top.equalTo(self.contentView.snp.top).offset(20)
            make.width.equalTo(fullScreenSize.width)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.width.equalTo(contentView.snp.width).offset(-40)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(addressLabel.snp.left)
            make.top.equalTo(addressLabel.snp.bottom).offset(20)
        }
        
        openTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(descriptionLabel.snp.left)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.width.equalTo(contentView.snp.width).offset(-40)
        }
        
    }
    
    func updateFrame(coffeeShop:CoffeeShopData) {
        
        nameLabel.text = "店名：\(coffeeShop.name)"
        addressLabel.text = "地址：\(coffeeShop.address)"
        
        let rate = coffeeShop.seatRate
        var descriptionText = "這間店座椅的舒適度評價有 \(rate) 分"
        
        if rate >= 4 {
            descriptionText += "，很棒喔！"
        } else {
            descriptionText += "，是個爛店！"
        }
        
        descriptionLabel.text = descriptionText
        
        var openTimeDescription = coffeeShop.openTime
        
        if openTimeDescription.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            openTimeDescription = "該店無公布營業時間"
        }
        openTimeLabel.text = "營業時間：\(openTimeDescription)"
    }
    
    //可能可以搬去util
    //decimal
//    func floatFormat<T>(floatNumber: T) -> T {
//        let f: Float
//        if let number = floatNumber as? Float {
//
//            if number.truncatingRemainder(dividingBy: 1) == 0 {
//                return Int(number)
//            } else {
//                return number
//            }
//        }
//    }
}
