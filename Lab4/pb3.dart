class MathOps<T , G> {
  int sub(T obj1, G obj2) {
    if(obj1 is double && obj2 is double)
    {
      return (obj1 - obj2).toInt();
    }
    else if(obj1 is String && obj2 is String)
    {
      return (int.parse(obj1) - int.parse(obj2));
    }
    else if( obj1 is int && obj2 is int){
        return (obj1 - obj2);
    }
    return 0;
  }

  int prod(T obj1, G obj2) {
    if(obj1 is double && obj2 is double)
    {
      return (obj1 * obj2).toInt();
    }
    else if(obj1 is String && obj2 is String)
    {
      return (int.parse(obj1) * int.parse(obj2));
    }
    else if( obj1 is int && obj2 is int){
        return (obj1 * obj2);
    }
    return 0;
  }

  int mod(T obj1, G obj2) {
    if(obj1 is double && obj2 is double)
    {
      return (obj1 % obj2).toInt();
    }
    else if(obj1 is String && obj2 is String)
    {
      return (int.parse(obj1) % int.parse(obj2));
    }
    else if( obj1 is int && obj2 is int){
        return (obj1 % obj2);
    }
    return 0;
  }
}

void main(){
  var m = MathOps();
  String x = "30";
  String y = "3";
  print(m.sub(x, y));
  print(m.prod(10, 10));
  print(m.mod(4.5, 1.2));
}