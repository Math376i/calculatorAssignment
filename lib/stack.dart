class InputStack<T> {
  final List<T> _list = [];
  void push(T value) => _list.add(value);
  T? pop() => _list.removeLast();
  T? peek() => _list.last;
  void clear() => _list.clear();
  int get length => _list.length;
  String toString() => _list.join(' ');
}
