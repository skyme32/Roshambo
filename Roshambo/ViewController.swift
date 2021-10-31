//
//  ViewController.swift
//  Roshambo
//
//  Created by skyme32 on 26/10/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    var match: RPSMatch!
    var history = [RPSMatch]()
    
    
    // MARK: Outlets
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    
    // MARK: Actions
    // The RPS enum holds a player's move
    @IBAction func makeYourMove(_ sender: UIButton) {
        switch (sender) {
        case self.rockButton:
            throwDown(RPS.rock)
        case self.paperButton:
            throwDown(RPS.paper)
        case self.scissorsButton:
            throwDown(RPS.scissors)
        default:
            assert(false, "An unknown button is invoking makeYourMove()")
        }
    }
    
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Notice that this code works for both Scissors and Paper
        let controller = segue.destination as! GameController
        controller.match = self.match
    }
    
    
    // MARK: Play!
    func throwDown(_ playersMove: RPS) {
        // The RPS enum generates the opponent's move
        let computersMove = RPS()
        
        // The RPSMatch struct stores the results of a match
        self.match = RPSMatch(p1: playersMove, p2: computersMove)
        
        // Here we add a match to the history array.
        history.append(match)
        
        // 1st Way: Programmatic View Controller Presentation
        if (playersMove == RPS.rock || playersMove == RPS.paper) {
            performSegue(withIdentifier: "play", sender: self)
        }
    }


}

