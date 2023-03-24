// Implement a Stack using files as storage.
import "dart:io";

class Stack<T>
{
  final File _stackFile; // the file to be used as a stack

  Stack(this._stackFile);

  void push(T element){
    // converting element to be written to file
    final bytes = element.toString() + '\n';

    // opening stack file 
    final elements = _stackFile.readAsLinesSync();
    final newStack = bytes + elements.join('\n');

    // writting element at the beggining of file
    _stackFile.writeAsStringSync(newStack);
  }

  T pop(){
    final stack = _stackFile.readAsLinesSync();
    final element = stack[0];
    stack.remove(stack[0]);
    if(stack.isNotEmpty){
      _stackFile.writeAsStringSync(stack[0]);
      for(int i = 1; i < stack.length; ++i){
        _stackFile.writeAsStringSync('\n' + stack[i], mode: FileMode.append);
      }
    }
    else{
      _stackFile.writeAsStringSync('');
    }
    return element as T;
  }

  bool isEmpty(){
    final stack = _stackFile.readAsLinesSync();
    if(stack.isEmpty){
      return true;
    }
    return false;
  }

}

void main()
{
  var f = File("C:\\Users\\Laura\\Desktop\\Lab4\\stack.txt");
  Stack s = Stack(f);
  s.push("elemen1");
  s.push("element2");
  print("Elem: ${s.pop()}");
  print(s.isEmpty());
  print("Elem: ${s.pop()}");
  print(s.isEmpty());
}