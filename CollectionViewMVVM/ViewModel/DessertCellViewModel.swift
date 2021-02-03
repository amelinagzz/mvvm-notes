//
//  ItemCellModel.swift
//  CollectionViewMVVM
//
//  Created by Adriana González Martínez on 5/5/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

struct DessertCellViewModel {
    let descriptionText: String
    var displayPrice: String?
    let price: Double
    
    mutating func getDisplayText() -> String?{
        //TODO: format the text to return the image and price with a $ sign and two decimal numbers
        return ""
    }
}
