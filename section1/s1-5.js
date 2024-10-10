//7개의 수가 주어지면 그 숫자 중 가장 작은 수를 출력하는 프로그램을 작성하시오.
function solution(arr) {
  let answer,
    min = Number.MAX_SAFE_INTEGER;
  //안정적인 정수중 가장 큰 값으로 초기화
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] < min) min = arr[i];
  }
  answer = min;
  return answer;
}
// 쉬운 방법 Math.min 가장작은 숫자 찾아주기, Math.max
// let answer=Math.min(...arr);
// return answer;

let arr = [5, 7, 1, 3, 2, 9, 11];
console.log(solution(arr));
