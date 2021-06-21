import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, Codable, CaseIterable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {

    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.suit == rhs.suit && lhs.value == rhs.value
    }
}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {
        
        var canBeat: Bool = false
        
        if self.isTrump && !card.isTrump {
            canBeat = true
        }
        
        if self.suit == card.suit && self.value.rawValue > card.value.rawValue {
            canBeat = true
        }
        
        return canBeat
    }

    func checkValue(card: Card) -> Bool {
        return false
    }
}
