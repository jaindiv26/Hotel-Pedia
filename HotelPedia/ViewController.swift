//
//  ViewController.swift
//  HotelPedia
//
//  Created by Divyansh  Jain on 20/09/19.
//  Copyright © 2019 Divyansh  Jain. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
    MainViewModelDelegate
{
    
    var model: [HotelModel] = []
    var viewModel: ViewModel?
    let flowLayout = UICollectionViewFlowLayout()
    var collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowLayout.scrollDirection = .vertical
//        let screenSize: CGRect = UIScreen.main.bounds
//        let screenWidth = screenSize.width
//        flowLayout.estimatedItemSize = CGSize(width: (screenWidth/2)-6, height: (screenWidth/2)-6)
//        flowLayout.itemSize = CGSize(width: (screenWidth/2)-6, height: (screenWidth/2)-6)
        flowLayout.minimumInteritemSpacing = 10
        collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        collectionView.register(HotelCell.self, forCellWithReuseIdentifier: "hotelCell")
        collectionView.backgroundColor = .white
        
        viewModel = ViewModel.init(delegate: self)
        viewModel?.loadItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hotelCell", for: indexPath) as! HotelCell
        cell.addData(hotelModel: model[indexPath.row])
        return cell
    }
    
    func getItems(items: [HotelModel]) {
        self.model = items
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        return CGSize(width: (screenWidth/2)-6, height: (screenWidth/2)-6)
    }
}


