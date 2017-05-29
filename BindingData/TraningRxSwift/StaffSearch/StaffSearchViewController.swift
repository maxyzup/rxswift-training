//
//  StaffSearchViewController.swift
//  TraningRxSwift
//
//  Created by Manh Nguyen on 5/29/17.
//  Copyright © 2017 NUS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class StaffSearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var disposeBag = DisposeBag()
    
    var shownCities = [String]() // Data source for UITableView
    let allCities = ["Hanoi", "HoChiMinh", "Chicago", "Shanghai", "Moscow", "Lagos", "Manila", "Toronto", "Recife", "Sapporo", "Portland"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Observing
        
        self.searchBar.rx.text
            .subscribe(onNext: { element in
                self.shownCities = self.allCities.filter { $0.hasPrefix(element!) }
                self.tableView.reloadData()
            })
            .addDisposableTo(disposeBag)
        
        // Delay
        
        self.searchBar.rx.text
            .throttle(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged({ (lhs, rhs) -> Bool in
                return lhs == rhs
            })
            .subscribe(onNext: { element in
                self.shownCities = self.allCities.filter { $0.hasPrefix(element!) }
                self.tableView.reloadData()
            })
            .addDisposableTo(disposeBag)
    }
}

extension StaffSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = shownCities[indexPath.row]
        return cell
    }
}
