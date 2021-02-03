//
//  ItemCell.swift
//  CollectionViewMVVM
//
//  Created by Adriana González Martínez on 5/5/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    static var identifier: String = "ItemCell"
        
    var textLabel: UILabel!
    
    var dessertCellViewModel : DessertCellViewModel? {
        didSet {
            textLabel.text = "TODO"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let textLabel = UILabel(frame: .zero)
        textLabel.font = UIFont.systemFont(ofSize: 50.0)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
        ])
        
        self.backgroundColor = UIColor.init(red: 225/255.0, green: 215/255.0, blue: 247/255.0, alpha: 1)
        self.textLabel = textLabel
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
