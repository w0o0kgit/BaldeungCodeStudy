import Foundation

func solution(_ begin: String, _ target: String, _ words: [String]) -> Int {
    guard words.contains(target) else { 
        return 0
    }

    var answerArr = [Int]()
    var visited = Array(repeating: false, count: words.count)
    visited[words.firstIndex(of: target)!] = true 
    func dfs(cnt: Int, current: String, visited: inout [Bool]) {
        if canChangeArr(compare1: current, compare2: begin) {
            answerArr.append(cnt + 1)
        }
        for (idx, item) in words.enumerated() {
            if !visited[idx] && canChangeArr(compare1: current, compare2: item) {
                visited[idx] = true
                
                dfs(cnt: cnt + 1, current: item, visited: &visited)

            }
        }
    }

    func canChangeArr(compare1: String, compare2: String) -> Bool {
        return zip(compare1, compare2).filter { $0 != $1 }.count == 1
    }
    dfs(cnt: 0, current: target, visited: &visited)

    return answerArr.min()!
}