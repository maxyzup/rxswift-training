//
//  Food.swift
//  TrainingMVVM
//
//  Created by Manh Nguyen on 6/10/17.
//  Copyright © 2017 NUS. All rights reserved.
//

import UIKit

class Food: NSObject {
    var name: String
    var country: String
    var price: Double
    var photoURL: String
    
    init(name: String, country: String, price: Double, photoURL: String) {
        self.name = name
        self.country = country
        self.price = price
        self.photoURL = photoURL
    }
}
