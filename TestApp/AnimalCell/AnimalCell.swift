//
//  AnimalCell.swift
//  TestApp
//
//  Created by Tarasenko Jurik on 30.07.2018.
//  Copyright © 2018 Tarasenko Jurik. All rights reserved.
//

import UIKit

protocol CustomCellProtocol: class {
   // var setProfileImage: UIImage { get set }
    var setName: String { get set }
    
}

final class AnimalCell: UICollectionViewCell {
    
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var regionLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet private weak var lenghtLabel: UILabel!
 
}

extension AnimalCell: CustomCellProtocol {
    
    var setName: String {
        get { return self.nameLabel.text ?? "" }
        set { self.nameLabel.text = newValue }
    }
    
    
}
