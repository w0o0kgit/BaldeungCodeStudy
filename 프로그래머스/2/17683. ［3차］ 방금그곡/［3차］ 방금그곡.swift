import Foundation

// 문자열의 각 #음을 소문자로 치환해주는 함수
func replacestr(_ input: String) -> String{
    
    return input.replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
        .replacingOccurrences(of: "B#", with: "b")
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var dic = [(name: String, melody: String, index: Int, playtime: Int)]()
    var answer = [(name: String, melody: String, index: Int, playtime: Int)]()
    let M = replacestr(m)
    
    for idx in 0..<musicinfos.count {
        //문자열을 ,로 나누고 이름, 흘러나온 멜로디, 재생시간, 인덱스를 구한다.
        let data = musicinfos[idx].components(separatedBy: ",")
        let name = data[2]
        let tmpmelody = replacestr(data[3])
        //재생 시간은 시작시간과 종료시간을 구해 분으로 변경하고, 종료시간에서 시작시간을 뺀게 재생시간이다.
        let starttime =  data[0].components(separatedBy: ":")
        let endtime = data[1].components(separatedBy: ":")
        let playtime =  ((Int(endtime[0])! * 60 ) + Int(endtime[1])!) - ((Int(starttime[0])! * 60 + Int(starttime[1])!))
        
        var melody = ""
        //실제 라디오에서 재생된 멜로디는 playtime만큼 나온다. 재생시간이 더 짧을 경우 재생시간 만큼만 저장하고,
        //재생시간이 더 길다면 음악은 반복되기 때문에 %연산을 통해 실제 재생된 멜로디를 구한다.
        for i in 0..<playtime{
            melody += String(Array(tmpmelody)[i % tmpmelody.count])
        }
        //이를 튜플에 저장해주고
        dic.append((name: name, melody: melody, index: idx, playtime: playtime))
    }
    //튜플에서 필터링을 거치게 되는데 M멜로디가 포함되어 있는걸 찾는다
    //이후 정렬을 통해 재생시간이 같다면 인덱스가 적은것, 다르다면 재생시간이 긴것을 내림차순으로 정렬을한다.
    answer = dic.filter{ $0.melody.contains(M)}.sorted{
        if $0.playtime == $1.playtime{
            return $0.index < $1.index
        }
        return $0.playtime > $1.playtime
    }
    
    //answer가 비어있다면 (None)을 출력한다
    if answer.isEmpty{
        return "(None)"
    }
    
    return answer[0].name
}