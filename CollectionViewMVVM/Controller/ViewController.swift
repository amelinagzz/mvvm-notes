//
//  ViewController.swift
//  collections
//
//  Created by Adriana González Martínez on 11/26/18.
//  Copyright © 2018 Adriana González Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //View model property goes in the VC
    lazy var viewModel: DessertCollectionViewModel = {
        return DessertCollectionViewModel()
    }()
    
    lazy var collectionView: UICollectionView = {
        let flow = CustomFlowLayout()

        // Instantiating the UICollectionView
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flow)
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Setting the datasource & delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Customization
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        //Registering the cell
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.identifier)
        
        return collectionView
    }()
        
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        //Creating pages (could be fetching data in a different example)
        viewModel.createPages()
        
        //Added the closure to observe changes and reload the collection view
        viewModel.reloadCollectionViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        //The view model knows how many items we want to show
        return viewModel.numberOfCells

    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath as IndexPath) as! ItemCell
        
        //Getting the view model for a cell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        
        //Setting the view model
        cell.DessertCellViewModel = cellVM
        
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        guard let cv = collectionView else { return }
        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        let minColumnWidth = CGFloat(300)
        let maxNumColumns = Int(availableWidth/minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        self.itemSize = CGSize(width: cellWidth, height: 70.0)
        self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.sectionInsetReference = .fromSafeArea
    }
}
