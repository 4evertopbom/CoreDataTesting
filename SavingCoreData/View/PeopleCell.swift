//
//  PeopleCell.swift
//  SavingCoreData
//
//  Created by Hoang Anh Tuan on 3/11/19.
//  Copyright © 2019 Hoang Anh Tuan. All rights reserved.
//

import Foundation
import UIKit

class PeopleCell: UICollectionViewCell {
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Name: "
        return lb
    }()
    
    let nameLB: UILabel = {
        let lb = UILabel()
        lb.text = ""
        return lb
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(nameLabel)
        addSubview(nameLB)
        
        nameLabel.anchor(top: topAnchor, paddingtop: 20, left: leftAnchor, paddingleft: 10, right: nil, paddingright: 20, bot: nil, botpadding: 0, height: 20, width: 60)
        nameLB.anchor(top: topAnchor, paddingtop: 20, left: nameLabel.rightAnchor, paddingleft: 10, right: rightAnchor, paddingright: 10, bot: nil, botpadding: 0, height: 20, width: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, paddingtop: CGFloat, left: NSLayoutXAxisAnchor?, paddingleft: CGFloat, right: NSLayoutXAxisAnchor?, paddingright: CGFloat, bot: NSLayoutYAxisAnchor?, botpadding: CGFloat, height: CGFloat, width: CGFloat){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingtop).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingright).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingleft).isActive = true
        }
        
        if let bot = bot {
            self.bottomAnchor.constraint(equalTo: bot, constant: botpadding).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
