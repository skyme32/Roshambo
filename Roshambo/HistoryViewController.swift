//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by skyme32 on 31/10/21.
//

import UIKit

class HistoryViewController: UIViewController {
    
    // MARK: Properties
    var history: [RPSMatch]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}



// MARK:
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
    }
    

}
