//
//  SimpleValidationViewController.swift
//  TraningRxSwift
//
//  Created by Manh Nguyen on 5/29/17.
//  Copyright © 2017 NUS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

let MINIMAL_LENGHT: Int = 5

class SimpleValidationViewController: UIViewController {
    
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    
    @IBOutlet weak var inputFistname: UITextField!
    @IBOutlet weak var inputLastname: UITextField!
    
    @IBOutlet weak var validateFistname: UILabel!
    @IBOutlet weak var validateLastname: UILabel!
    
    @IBOutlet weak var buttonCheck: UIButton!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        validateFistname.text = "Username has to be at least \(MINIMAL_LENGHT) characters"
        validateLastname.text = "Password has to be at least \(MINIMAL_LENGHT) characters"
        
        
        let usernameValid = inputFistname.rx.text.orEmpty
            .map { $0.characters.count >= MINIMAL_LENGHT }
            .shareReplay(1)
        
        let passwordValid = inputLastname.rx.text.orEmpty
            .map { $0.characters.count >= MINIMAL_LENGHT }
            .shareReplay(1)
        
        let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .shareReplay(1)
        
        usernameValid
            .bind(to: validateFistname.rx.isHidden)
            .disposed(by: disposeBag)
        
        passwordValid
            .bind(to: validateLastname.rx.isHidden)
            .disposed(by: disposeBag)
        
        everythingValid
            .bind(to: buttonCheck.rx.isEnabled)
            .disposed(by: disposeBag)
        
        buttonCheck.rx.tap
            .subscribe(onNext: { [weak self] in self?.showAlert() })
            .disposed(by: disposeBag)
        
    }

    func showAlert() {
        let alertView = UIAlertController(title: "RxSwift", message: "NUS Technology", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            UIAlertAction in
        }
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }
}
