//
//  Consentration.swift
//  Concentration
//
//  Created by Konstantin on 03/01/2019.
//  Copyright © 2019 Konstantin Meleshko. All rights reserved.
//

import Foundation

class Concetration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) { // func for couse card on the play board 
        if !cards[index].isMached {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMached = true
                    cards[index].isMached = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func shuffleCards() -> [Card] {
        let shuffleCardsArray = cards.shuffled()
        return shuffleCardsArray
    }
    
    init(numberOfPairsOfCards: Int) {
        var shuffeledCards = [Card]()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            shuffeledCards += [card, card]
        }
        cards = shuffeledCards.shuffled()
    }
    
}
