class InstanceStore {
  static final Map<dynamic, dynamic> _item = <dynamic, dynamic>{};
  static final InstanceStore _cache = InstanceStore._internal();
  
  factory InstanceStore() {
    return _cache;
  }
  
  InstanceStore._internal();

  T setInstance<T>(T value) => _item[T.toString()] = value;
  T getInstance<T>() => _item[T.toString()];
}