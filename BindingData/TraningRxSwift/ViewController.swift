//
//  ViewController.swift
//  TraningRxSwift
//
//  Created by Manh Nguyen on 5/29/17.
//  Copyright © 2017 NUS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let sections = ["Simple Validation", "City Search"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = UITableViewCell()
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.textLabel?.textColor = UIColor.brown
        cell.textLabel?.text = sections[section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "Without Rx"
            } else {
                cell.textLabel?.text = "Using RxSwift"
            }
        } else {
            cell.textLabel?.text = "Using RxSwift"
        }
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            if indexPath.row == 1 {
                let simpleValidation = Storyboard.Validation.instance.instantiateViewController(withIdentifier: "SimpleValidationViewControllerID")
                navigationController?.pushViewController(simpleValidation, animated: true)
            } else {
                let simpleValidationWithoutRx = Storyboard.Validation.instance.instantiateViewController(withIdentifier: "SimpleValidationWithoutRxViewControllerID")
                navigationController?.pushViewController(simpleValidationWithoutRx, animated: true)
            }
        } else {
            let staffView = Storyboard.Staff.instance.instantiateViewController(withIdentifier: "StaffSearchViewControllerID")
            navigationController?.pushViewController(staffView, animated: true)
        }
    }
}

