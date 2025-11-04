#include <string>
#include <vector>
#include <algorithm>

using namespace std;

string solution(vector<string> participant, vector<string> completion) {
    string answer = "";
    
    unordered_map<string, int> map;
    for (auto player : participant)
    {
        if (map.end() == map.find(player))
            map.insert(make_pair(player, 1));
        else
            map[player]++;
    }

    for (auto player : completion)
    {
        map[player]--;
    }

    for(auto player : participant)
    {
        if (map[player] > 0)
        {
            answer = player;
            break;
        }
    }
        
    return answer;
    
        
//     sort(participant.begin(), participant.end());
//     sort(completion.begin(), completion.end());
//     for(int i = 0; i < completion.size(); i++) {
//         for(int j = 0; j < participant.size();) {
//             if(completion[i] == participant[j]) {
//                 participant.erase(participant.begin() + j);
//                 break;
//             }
//             else
//                 j++;
            
//         }
//     }
    
    // for (int i = 0; i < completion.size(); i++ ) {
    //     participant.erase(remove(participant.begin(), participant.end(), completion[i]),participant.end());
    // }
    // for(int i = 0; i < participant.size(); i++ ) {
    //     answer += participant[i];
    // }
    return answer;
}