import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var musics = [String: [Music]]()
    var genrePlayCount = [String: Int]()
    
    var sol = [Int]()
    
    for (index, genre) in genres.enumerated() {
        if musics[genre] == nil {
            musics[genre] = [Music(id: index, plays: plays[index])] 
        } else {
            musics[genre]?.append(Music(id: index, plays: plays[index]))
        }
        
        if genrePlayCount[genre] == nil {
            genrePlayCount[genre] = plays[index]
        } else {
            genrePlayCount[genre] = plays[index] + genrePlayCount[genre]!
        }
    }
    
    let sorted = genrePlayCount.sorted { $0.value > $1.value }
    
    for (key, value) in sorted {
        let appendee = musics[key]!.sorted { 
            $0.plays > $1.plays 
        }.prefix(2).map { $0.id }
        sol.append(contentsOf: appendee)
    }
    
    return sol
}

struct Music {
    let id: Int
    let plays: Int
}