import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        
        var deck = [Card]()
        
        for suit in suits {
            for value in values {
                deck.append(Card(suit: suit, value: value))
            }
        }
        
        return deck
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        trump = cards.last?.suit
        for (index, anyCard) in cards.enumerated() {
            if anyCard.suit == trump {
                cards[index].isTrump = true
            }
        }
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        for player in players {
            if cards.count >= 6 {
                player.hand = cards.dropLast(6)
                cards.removeLast(6)
            }
        }
    }

    public func setTrumpCards(for suit:Suit) {

    }
}

