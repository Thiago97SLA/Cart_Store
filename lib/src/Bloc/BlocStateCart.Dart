import 'dart:async';

enum StatusCart { Pending, Completed }

class BlocStateCart {
  String status;
  final _stateStreamController = StreamController<String>.broadcast();
  StreamSink<String> get statusSink => _stateStreamController.sink;
  Stream<String> get statusStream => _stateStreamController.stream;

  final _evetStreamController = StreamController<StatusCart>.broadcast();
  StreamSink<StatusCart> get evetSink => _evetStreamController.sink;
  Stream<StatusCart> get evetStream => _evetStreamController.stream;

  BlocStateCart() {
    statusStream.listen((event) {});
    evetStream.listen((event) {
      if (event == StatusCart.Pending)
        status = 'Pending';
      else if (event == StatusCart.Completed) status = 'Completed';

      statusSink.add(status);
    });
  }
}
