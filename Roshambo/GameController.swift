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
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    
    // MARK: Outlets
    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    // MARK: UI
    // The displayResult method generates the image and message for the results of a match.
    private func displayResult() {
        // Ideally, most of this would be handled by a model.
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "itsATie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        
        
        //imageName = imageName.lowercased()
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }
    
    // MARK: Actions
    @IBAction private func playAgain() {
        dismiss(animated: true, completion: nil)
    }
    
}
