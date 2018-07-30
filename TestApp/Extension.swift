//
//  Extension.swift
//  TestApp
//
//  Created by Tarasenko Jurik on 30.07.2018.
//  Copyright © 2018 Tarasenko Jurik. All rights reserved.
//

import UIKit

extension UICollectionViewController {
    
    func showAlert(title: String, msg: String, customActions: [UIAlertAction] = []) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
            
            if customActions.isEmpty {
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            } else {
                for action in customActions {
                    alert.addAction(action)
                }
            }
            self.present(alert, animated: true, completion: nil)
        }
    }
}
