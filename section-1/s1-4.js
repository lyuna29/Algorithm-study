//title:1부터N까지의합
//level:0
//자연수 N이 입력되면 1부터 N까지의 합을 출력하는 프로그램을 작성하세요.
function solution(n) {
  let answer;
  answer = (n * (n + 1)) / 2;
  return answer;
}

console.log(solution(10));
