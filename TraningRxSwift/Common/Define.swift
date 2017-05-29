//
//  Define.swift
//  TraningRxSwift
//
//  Created by Manh Nguyen on 5/29/17.
//  Copyright © 2017 NUS. All rights reserved.
//

import UIKit


enum Storyboard: String {
    
    case Validation     = "Validation"
    case Staff          = "Staff"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
}
