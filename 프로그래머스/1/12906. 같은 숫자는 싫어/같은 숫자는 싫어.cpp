#include <vector>
#include <iostream>

using namespace std;

vector<int> solution(vector<int> arr) 
{
    vector<int> answer;
    
    answer.push_back(arr[0]);
    
    int i=1;
    int index=0;
    while(i<arr.size())
    {
        if(answer[index] != arr[i])
        {
            answer.push_back(arr[i]);
            index++;
            
        }
        i++;
    }

    return answer;
}