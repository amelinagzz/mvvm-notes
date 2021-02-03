//
//  DessertCellViewModel.swift
//  CollectionViewMVVM
//
//  Created by Adriana González Martínez on 5/5/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

class DessertCollectionViewModel {
    
    private var items: [Dessert]!
    
    private var cellViewModels: [DessertCellViewModel] = [DessertCellViewModel]() {
        didSet {
            self.reloadCollectionViewClosure?()
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    var reloadCollectionViewClosure: (()->())?
    
    func getCellViewModel(at indexPath: IndexPath ) -> DessertCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel(item: Dessert ) -> DessertCellViewModel {
        return DessertCellViewModel(descriptionText: item.description, displayPrice: nil, price: item.price)
    }
    
    func createDessert( ) { // pretending to be a network call + encoding

        let items = [
            Dessert(description: "🍰", price: 180),
            Dessert(description: "☕️", price: 20),
            Dessert(description: "🥐", price: 20)
        ]
        
        var vms = [DessertCellViewModel]()
        
        for item in items {
            vms.append(createCellViewModel(item: item) )
        }
        self.cellViewModels = vms
    }
    
}


