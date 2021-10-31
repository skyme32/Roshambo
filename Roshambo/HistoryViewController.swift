//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by skyme32 on 31/10/21.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    var history: [RPSMatch]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: Outlet
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Table View Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMatch", for: indexPath)
        let match = self.history[(indexPath as NSIndexPath).row]
        
        cell.textLabel!.text = match.victoryStatusDescription()
        cell.detailTextLabel!.text = "\(match.p1) vs. \(match.p2)"
        cell.imageView?.image = match.imageForMatch()
        
        return cell
    }
    
    
    // MARK: Actions
    @IBAction func dismissHistory(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

}
