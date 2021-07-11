var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};

void main(List<String> args) {
  // 标准变量
  print(name);
  print(year);
  print(antennaDiameter);
  print(flybyObjects);
  print(image);

  flybyObjects.where((item) => item.contains('t')).forEach(print);
}
