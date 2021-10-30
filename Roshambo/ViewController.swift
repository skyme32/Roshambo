//
//  ViewController.swift
//  Roshambo
//
//  Created by skyme32 on 26/10/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: ROCK
    @IBAction private func playRock(_ sender: UIButton) {
        self.performSegue(withIdentifier: "play", sender: sender)
    }

    // MARK: PAPER
    @IBAction private func playPaper(_ sender: UIButton) {
        self.performSegue(withIdentifier: "play", sender: sender)
    }

    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! GameController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }

    // MARK: Utilities
    // The enum "Shape" represents a play or move
    private func getUserShape(_ sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.accessibilityHint!
        return Shape(rawValue: shape)!
    }

}

