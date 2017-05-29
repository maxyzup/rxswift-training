//
//  SimpleValidationWithoutRxViewController.swift
//  TraningRxSwift
//
//  Created by Manh Nguyen on 5/29/17.
//  Copyright © 2017 NUS. All rights reserved.
//

import UIKit

class SimpleValidationWithoutRxViewController: UIViewController {

    let MINIMAL_LENGHT: Int = 5
    
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    
    @IBOutlet weak var inputFistname: UITextField!
    @IBOutlet weak var inputLastname: UITextField!
    
    @IBOutlet weak var validateFistname: UILabel!
    @IBOutlet weak var validateLastname: UILabel!
    
    @IBOutlet weak var buttonCheck: UIButton!
    
    var validateFistnameText: String = ""
    var validateLastnameText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validateFistnameText = String(format: "Fistname has to be at least %d characters", MINIMAL_LENGHT)
        validateLastnameText = String(format: "Lastname has to be at least %d characters", MINIMAL_LENGHT)
        
        validateFistname.text = validateFistnameText
        validateLastname.text = validateLastnameText
        
        inputFistname.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                                          for: UIControlEvents.editingChanged)
        inputFistname.tag = 0
        inputLastname.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                                for: UIControlEvents.editingChanged)
        
        inputLastname.tag = 1
    }
    
    @IBAction func onClick(_ sender: Any) {
        if (inputFistname.text?.characters.count)! > 0 && (inputLastname.text?.characters.count)! > 0 {
            showAlert()
        }
    }
    
    func showAlert() {
        let alertView = UIAlertController(title: "RxSwift", message: "NUS Technology", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            UIAlertAction in
        }
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        if (textField.text?.characters.count)! > MINIMAL_LENGHT {
            if textField.tag == 0 {
                validateFistname.text = ""
            } else {
                validateLastname.text = ""
            }
        } else {
            if textField.tag == 0 {
                validateFistname.text = validateFistnameText
            } else {
                validateLastname.text = validateLastnameText
            }
            
        }
    }
}


