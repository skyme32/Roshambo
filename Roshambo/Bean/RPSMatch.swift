//
//  RPSMatch.swift
//  Roshambo
//
//  Created by skyme32 on 31/10/21.
//

import Foundation
import UIKit

// MARK: - RPSMatch
// The RPSMatch struct stores the results of a match.
// Now we're ready to store multiple matches in an array, so users can track their match history.
struct RPSMatch {
    
    // MARK: Properties
    let p1: RPS
    let p2: RPS
    
    // MARK: Initializer
    init(p1: RPS, p2: RPS) {
        self.p1 = p1
        self.p2 = p2
    }
    
    // MARK: Computed Properties
    var winner: RPS {
        get {
            return p1.defeats(p2) ? p1 : p2
        }
    }
    
    var loser: RPS {
        get {
            return p1.defeats(p2) ? p2 : p1
        }
    }
    
    // MARK:
    func victoryStatusDescription() -> String {
        if (self.p1 == self.p2) {
            return "Tie"
        } else if (self.p1.defeats(self.p2)) {
            return "Win"
        } else {
            return "Loss"
        }
    }
    
    
    // MARK: Image for Match
    func imageForMatch() -> UIImage {
        var name = ""
        
        switch (self.winner) {
        case .rock:
            name = "Rock-Scissors"
        case .paper:
            name = "Paper-Rock"
        case .scissors:
            name = "Scissors-Paper"
        }
        
        if self.p1 == self.p2 {
            name = "itsATie"
        }
        return UIImage(named: name)!
    }
}
