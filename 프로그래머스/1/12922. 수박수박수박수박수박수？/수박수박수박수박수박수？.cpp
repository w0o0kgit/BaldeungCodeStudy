#include <string>
#include <vector>

using namespace std;

string solution(int n) {
    string answer = "";
    int a = n / 2;
    int b = n % 2;
    
    for(int i = 0; i < a; i++)
    {
        answer.append("수박");
    }
    if(b == 1)
        answer.append("수");
    
    return answer;
}