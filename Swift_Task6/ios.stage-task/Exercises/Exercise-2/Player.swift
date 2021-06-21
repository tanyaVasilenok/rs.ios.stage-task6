//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        
        var canTossWhenAttacking = false
        
        for myCard in self.hand! {
            if myCard.value.rawValue == card.value.rawValue {
                canTossWhenAttacking = true
            }
        }
        
        return canTossWhenAttacking
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        
        var canTossWhenTossing = false
        
        self.hand?.forEach() { myCard in
            table.keys.forEach() { card in
                if card.value.rawValue == myCard.value.rawValue {
                    canTossWhenTossing = true
                }
            }
            table.values.forEach() { card in
                if card.value.rawValue == myCard.value.rawValue {
                    canTossWhenTossing = true
                    }
                }
            }
        
        return canTossWhenTossing
        
    }
}
