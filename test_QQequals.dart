void main() {
  String? name;
  print(name);
  name ??= 'soyoung';
  print(name);
  name = null;
  name ??= 'another';
  print(name);
}
