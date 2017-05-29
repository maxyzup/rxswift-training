//
//  FoodModelView.swift
//  TrainingMVVM
//
//  Created by Manh Nguyen on 6/10/17.
//  Copyright © 2017 NUS. All rights reserved.
//

import UIKit

class FoodModelView {
    
    private var food: Food
    static let tax = 0.1
    
    init(food: Food) {
        self.food = food
    }

    var name: String {
        return food.name
    }
    
    var country: String {
        return food.country
    }
    
    var priceWithTax: String {
        let price = food.price * FoodModelView.tax
        return "\(price) VND"
    }

    var photoURL: URL {
        return URL(string: food.photoURL)!
    }
}
