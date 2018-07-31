//
//  AnimalCell.swift
//  TestApp
//
//  Created by Tarasenko Jurik on 30.07.2018.
//  Copyright © 2018 Tarasenko Jurik. All rights reserved.
//

import SDWebImage
import UIKit

protocol CustomCellProtocol: class {
    var setName:   String { get set }
    var setRegion: String { get set }
    var setWeight: Int { get set }
    var setLenght: Int { get set }
    var setProfileImage: String { get set }
    func startSpiner()
}

final class AnimalCell: UICollectionViewCell {
    
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var regionLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet private weak var lenghtLabel: UILabel!
    @IBOutlet private weak var spiner: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = 15
        profileImage.clipsToBounds = true
    }
}

extension AnimalCell: CustomCellProtocol {
    
    func startSpiner() {
        spiner.startAnimating()
    }
    
    var setProfileImage: String {
        get { return String() }
        set {
            self.profileImage.sd_setImage(with: URL(string: newValue), placeholderImage: UIImage(named: "placeholder.png"), options: SDWebImageOptions()) { [weak self] (_, _, _, _) in
           self?.spiner.stopAnimating()
            }
        }
    }
    
    var setRegion: String {
        get { return String() }
        set { self.regionLabel.text = "Region:  " + newValue }
    }
    
    var setWeight: Int {
        get { return Int() }
        set { self.weightLabel.text = "Weight: \(newValue) kg" }
    }
    
    var setLenght: Int {
        get { return Int() }
        set { self.lenghtLabel.text = "Lenght: \(newValue) cm" }
    }

    var setName: String {
        get { return String() }
        set { self.nameLabel.text = newValue }
    }
}
