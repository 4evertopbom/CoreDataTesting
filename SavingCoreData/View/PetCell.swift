//
//  PetCell.swift
//  SavingCoreData
//
//  Created by Hoang Anh Tuan on 3/11/19.
//  Copyright © 2019 Hoang Anh Tuan. All rights reserved.
//

import Foundation
import UIKit

class PetCell: UICollectionViewCell {
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
    
    let typeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "type: "
        return lb
    }()
    
    let typeLB: UILabel = {
        let lb = UILabel()
        lb.text = "Name: "
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(nameLabel)
        addSubview(nameLB)
        addSubview(typeLB)
        addSubview(typeLabel)
        
        nameLabel.anchor(top: topAnchor, paddingtop: 20, left: leftAnchor, paddingleft: 10, right: nil, paddingright: 20, bot: nil, botpadding: 0, height: 20, width: 60)
        nameLB.anchor(top: topAnchor, paddingtop: 20, left: nameLabel.rightAnchor, paddingleft: 10, right: rightAnchor, paddingright: 10, bot: nil, botpadding: 0, height: 20, width: 0)
        typeLabel.anchor(top: nameLabel.bottomAnchor, paddingtop: 10, left: leftAnchor, paddingleft: 10, right: nil, paddingright: 0, bot: nil, botpadding: 0, height: 20, width: 60)
        typeLB.anchor(top: typeLabel.topAnchor, paddingtop: 0, left: typeLabel.rightAnchor, paddingleft: 10, right: rightAnchor, paddingright: 10, bot: nil, botpadding: 0, height: 20, width: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
