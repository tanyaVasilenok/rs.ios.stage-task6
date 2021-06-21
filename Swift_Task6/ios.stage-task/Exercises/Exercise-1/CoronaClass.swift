import Foundation

class CoronaClass {
 
    // array of taken seats
    var seats = [Int]()
    var countOfSeats: Int

    init(n: Int) {
        self.countOfSeats = n
    }
     
    func seat() -> Int {
        
        var takenSeat = 0
        let allSeats = [Int](0...countOfSeats-1)
        var allDistances = [Int]()
        
        // if no one place is taken
        if seats.isEmpty {
            takenSeat = 0
            seats.append(takenSeat)
            seats = seats.sorted()
            return takenSeat
        }
        
        for (index, _) in seats.enumerated() where index != seats.count-1 {
            let distance = ((seats[index+1]) - seats[index])/2
            allDistances.append(distance)
        }
        
        var maxDistance = allDistances.max() ?? 0
        
        if !(seats.first! == allSeats.first!) {
            let distance = seats.first! - allSeats.first!
            if distance >= maxDistance {
                maxDistance = distance
                takenSeat = allSeats.first!
                seats.append(takenSeat)
                seats = seats.sorted()
                return takenSeat
            }
        }
        
        if !(seats.last! == allSeats.last!) {
            let distance = allSeats.last! - seats.last!
            if distance >= maxDistance {
                maxDistance = distance
                takenSeat = allSeats.last!
                seats.append(takenSeat)
                seats = seats.sorted()
                return takenSeat
            }
        }
        
        for (i, _) in seats.enumerated() where i != seats.count-1{
            let distance = ((seats[i+1]) - seats[i])/2
            if distance == maxDistance {
                let tmpArray = [Int](seats[i]...seats[i+1])
                for (j, emptySeat) in tmpArray.enumerated() {
                    if j == distance {
                        takenSeat = emptySeat
                        seats.append(takenSeat)
                        seats = seats.sorted()
                        return takenSeat
                    }
                }
            }
        }
        
        seats = seats.sorted()
        return takenSeat
    }
     
    func leave(_ p: Int) {
        if let index = seats.firstIndex(of: p) {
            seats.remove(at: index)
        }
    }
}
