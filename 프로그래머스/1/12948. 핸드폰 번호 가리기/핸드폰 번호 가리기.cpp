#include <string>
#include <vector>

using namespace std;

string solution(string phone_number) {
    string answer = "";
    //string rep = "*";
    
    //phone_number.replace(0, phone_number.size() - 4, rep);
    for(int i = 0; i < phone_number.size() - 4; i++)
    {
        phone_number[i] = '*';
    }
    //swap(phone_number, answer);
    answer = phone_number;
    
    return answer;
}