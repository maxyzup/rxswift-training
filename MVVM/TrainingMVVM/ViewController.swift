//
//  ViewController.swift
//  TrainingMVVM
//
//  Created by Manh Nguyen on 6/10/17.
//  Copyright © 2017 NUS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let foods: [FoodModelView] = (UIApplication.shared.delegate as! AppDelegate).foods
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

