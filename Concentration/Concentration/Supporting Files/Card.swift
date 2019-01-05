//
//  Card.swift
//  Concentration
//
//  Created by Konstantin on 03/01/2019.
//  Copyright © 2019 Konstantin Meleshko. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false // that is the side card is display now
    var isMached = false // mached the card in the board
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
