//
//  Model.swift
//  TestApp
//
//  Created by Tarasenko Jurik on 30.07.2018.
//  Copyright © 2018 Tarasenko Jurik. All rights reserved.
//

import Foundation

struct Animal {
    let name: String
    let thumbnail: String
    let region: String
    let stats: Stats
}

struct Stats {
    let max_weight: Int
    let length: Int
}
