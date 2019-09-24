//
//  HotelCell.swift
//  HotelPedia
//
//  Created by Divyansh  Jain on 21/09/19.
//  Copyright © 2019 Divyansh  Jain. All rights reserved.
//

import Foundation
import UIKit

class HotelCell: UICollectionViewCell {
    
    let label = UILabel.init(frame: CGRect.init())
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .cyan
        
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0;
//        label.adjustsFontSizeToFitWidth = true
    }
    
    func addData(hotelModel: HotelModel) {
        label.text = hotelModel.name
    }
}
