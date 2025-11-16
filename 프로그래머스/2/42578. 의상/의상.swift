import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var sorted: [String: [String]] = [:]
    var count = 0
    var combination = 1
    
    for clothe in clothes {
        if sorted.keys.contains(clothe[1]) {
            sorted[clothe[1]]?.append(clothe[0])
        } else {
            sorted[clothe[1]] = [clothe[0]]
        }
    }
    for part in sorted {
        combination *= (part.value.count + 1)
        count += part.value.count
    }
    return combination - 1
}