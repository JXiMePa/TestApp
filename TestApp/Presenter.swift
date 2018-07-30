//
//  Presenter.swift
//  TestApp
//
//  Created by Tarasenko Jurik on 30.07.2018.
//  Copyright © 2018 Tarasenko Jurik. All rights reserved.
//

import Foundation

protocol PresenterProtocol: class {
    init(controller: AnimalCollectionVCProtocol)
    func configurateCell(_ cell: AnimalCell, byItem: Int)
    func getNumberOfItemsInSection() -> Int
}

final class Presenter: PresenterProtocol {
    
    private var controller: AnimalCollectionVCProtocol
    
    private var animalData = [Animal]() {
        didSet {
            controller.reloadCollectionView()
        }
    }
    
    init(controller: AnimalCollectionVCProtocol) {
        self.controller = controller
        setModel(data: getJSON())
    }
    
    private func getJSON() -> [[String: AnyObject]] {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let jsonResult = json as? Dictionary<String, AnyObject>, let data = jsonResult["data"] as? [[String: AnyObject]] {
                    return data

                }
            } catch let error {
                controller.showAlert(title: "", msg: "Error")
                print(error)
            }
        }
        return [[:]]
    }
    
    private func setModel(data:[[String: AnyObject]]) {
        
        for animal in data {
            guard let name = animal["name"] as? String else { return }
            guard let thumbnail = animal["thumbnail"] as? String else { return }
            guard let region = animal["region"] as? String else { return }
            guard let statsData = animal["stats"] as? [String: AnyObject] else { return }
            guard let max_weight = statsData["max_weight"] as? Int else { return }
            guard let length = statsData["length"] as? Int else { return }
            
            let stats = Stats(max_weight: max_weight, length: length)
            let animal = Animal(name: name, thumbnail: thumbnail, region: region, stats: stats)
            self.animalData.append(animal)
        }
    }
    
    func configurateCell(_ cell: AnimalCell, byItem: Int) {
        cell.setName = animalData[byItem].name
    }
    
    func getNumberOfItemsInSection() -> Int {
        return animalData.count
    }
}

