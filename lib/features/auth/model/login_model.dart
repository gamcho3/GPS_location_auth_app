import 'dart:async';

abstract class King {
  void answer(); // 메세지
}

class Hat extends King {
  @override
  void answer() {
    // TODO: implement answer
  }
}

class Alice extends King {
  @override
  void answer() {
    // TODO: implement answer
  }
}

void main() {
  print(King is Hat);
}
