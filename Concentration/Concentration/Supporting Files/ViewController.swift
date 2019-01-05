//
//  ViewController.swift
//  Concentration
//
//  Created by Konstantin on 23/12/2018.
//  Copyright © 2018 Konstantin Meleshko. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    var emojiArray: [String] = ["🐿", "🐇", "👻", "🌯", "☠️", "👽", "😈", "🐨"] //"🦊", "🐣", "🎾", "🚗"]
    var emojiDictionarry = [Int: String]()
    
    lazy var game: Concetration = Concetration(numberOfPairsOfCards: cardButtons.count / 2)
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "FlipCoгnt: \(flipCount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewForModel()
        } else {
            print("card is not in array")
        }
    }
    
    func emoji(for card: Card) -> String {
        if emojiDictionarry[card.identifier] == nil, emojiArray.count > 0 {
            let randeomIndex = Int(arc4random_uniform(UInt32(emojiArray.count)))
            emojiDictionarry[card.identifier] = emojiArray.remove(at: randeomIndex)
        }
        return emojiDictionarry[card.identifier] ?? "?"
    }
    
    func updateViewForModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMached ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flipCountLabel.text = "FlipCoгnt: \(flipCount)"
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}

