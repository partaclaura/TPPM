// Implement a Queue (push(), pop(), back(), front(), isEmpty(), toString()).

class Queue<E> {
  final q_list = <E>[];

  void push(E val) => q_list.add(val);

  E pop() => q_list.removeAt(0);

  E front() => q_list.elementAt(0);

  E back() => q_list.elementAt(q_list.length - 1);

  bool get isEmpty => q_list.isEmpty;
  
  @override
  String toString() => q_list.toString();
}

void main(){
  var q = Queue();
  q.push(3);
  q.push(5);
  q.push(1);
  print(q.toString());
  q.pop();
  print(q.toString());
  print(q.back());
  print(q.front());
  print(q.toString());
  print(q.isEmpty);
  q.pop();
  q.pop();
  print(q.isEmpty);

}