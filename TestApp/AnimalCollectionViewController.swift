//
//  AnimalCollectionViewController.swift
//  TestApp
//
//  Created by Tarasenko Jurik on 30.07.2018.
//  Copyright © 2018 Tarasenko Jurik. All rights reserved.
//

import UIKit

protocol AnimalCollectionVCProtocol {
    func reloadCollectionView()
    func alertShow(title: String, msg: String)
}

private let reuseIdentifier = "Cell"

class AnimalCollectionViewController: UICollectionViewController {
    
    
    private var presenter: PresenterProtocol!
    
//MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !Reachability.isConnectedToNetwork() {
            self.alertShow(title: "Internet 😓", msg: "Connection not Available!")
        }
        
        self.presenter = Presenter(controller: self)
        
        self.collectionView!.register(UINib(nibName: "AnimalCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
    
//MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getNumberOfItemsInSection()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AnimalCell
        presenter.configurateCell(cell, byItem: indexPath.item)
        return cell
    }
}

//MARK: ViewControllerProtocol
extension AnimalCollectionViewController: AnimalCollectionVCProtocol {
    
    func alertShow(title: String, msg: String) {
        self.showAlert(title: title, msg: msg)
    }
    
    func reloadCollectionView() {
        self.collectionView?.reloadData()
    }  
}
