//
//  Meme.swift
//  Roshambo
//
//  Created by skyme32 on 31/10/21.
//

import Foundation

// MARK: - Shape: String
// The enum "Shape" represents a play or move
enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    // This function randomly generates an opponent's play
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}
