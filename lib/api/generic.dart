typedef Create<T> = T Function();

abstract class Decodeable<T> {
  T decode(dynamic data);
}

abstract class GenericObject<T> {
  // define a typedef with Decodeable object
  Create<Decodeable> create;

  // init object with create param
  GenericObject({required this.create});

  T genericObject(dynamic data) {
    // get create object
    final item = create();
    // now, we can call decode func from Decodeable class
    return item.decode(data);
  }
}
