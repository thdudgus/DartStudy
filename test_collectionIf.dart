void main() {
  bool giveMeFive = true;

  var numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5, // giveMeFive가 true일 때, 5를 numbers에 추가
  ];

  print(numbers);
}
