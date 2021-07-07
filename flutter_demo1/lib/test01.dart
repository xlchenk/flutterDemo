main(List<String> args) {
  String name = 'dsfsfsfsfdd';

  int age = 13;
  double height = 1.33;

  print('$name === $height === $age');

  var name2 = 'ldfjsflj';
  name2 = 'contentr';
  print(name2.runtimeType);

// const在赋值时, 赋值的内容必须是在编译期间就确定下来的
//  inal在赋值时, 可以动态获取, 比如赋值一个函数
  final time = DateTime.now();
  print('$time');

  var s3 = 'Hello\'Fullter';
  var s4 = "Hello'Fullter";
  print('$s3');
  print('$s4');
  printElement(item) {
    print(item);
  }

  var movies = ['盗梦空间', '星际穿越', '少年派', '大话西游'];
  movies.forEach(printElement);
}
