//
//  GameController.swift
//  Roshambo
//
//  Created by skyme32 on 26/10/21.
//

import UIKit



class GameController: UIViewController {
    
    // MARK: Properties
    // When the ResultsViewController is initialized a userChoice is passed in and an opponent's play is generated.
    var match: RPSMatch!
    var message: NSString!
    var picture: UIImage!
    
    // MARK: Outlets
    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.resultLabel.text = messageForMatch(match)
        self.resultImage.image = imageForMatch(match)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.5) {
            self.resultImage.alpha = 1;
        }
    }
    
    
    // MARK: Actions
    @IBAction private func playAgain() {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Messages for Match
    func messageForMatch(_ match: RPSMatch) -> String {
        
        // Handle the tie
        if match.p1 == match.p2 {
            return "It's a tie!"
        }
        
        // Here we build up the results message "RockCrushesScissors. You Win!" etc.
        return match.winner.description + " " + victoryModeString(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    
    func resultString(_ match: RPSMatch) -> String {
        return match.p1.defeats(match.p2) ? "You Win!" : "You Lose!"
    }
    
    func victoryModeString(_ gesture: RPS) -> String {
        switch (gesture) {
        case .rock:
            return "crushes"
        case .scissors:
            return "cuts"
        case .paper:
            return "covers"
        }
    }
    
    
    // MARK: Image for Match
    func imageForMatch(_ match: RPSMatch) -> UIImage {
        var name = ""
        
        switch (match.winner) {
        case .rock:
            name = "Rock-Scissors"
        case .paper:
            name = "Paper-Rock"
        case .scissors:
            name = "Scissors-Paper"
        }
        
        if match.p1 == match.p2 {
            name = "itsATie"
        }
        return UIImage(named: name)!
    }
    
}
