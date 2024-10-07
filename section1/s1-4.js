//자연수 N이 입력되면 1부터 N까지의 합을 출력하는 프로그램을 작성하라.
function solution(n) {
  let answer;
  answer = (n * (n + 1)) / 2;
  //   for (let i = 1; i <= n; i++) {
  //     answer = answer + i;
  //   }
  return answer;
}

console.log(solution(10));
