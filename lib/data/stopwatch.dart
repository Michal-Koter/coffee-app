class Stopwatch {
  DateTime? start;
  List<DateTime> rounds = [];
  DateTime? stop;
  Duration? clock = const Duration();

  Stopwatch();

  void setStart() {
    start = DateTime.now();
    stop = null;
  }

  void setStop() {
    stop = DateTime.now();
  }

  void round() {
    rounds.add(DateTime.now());
  }

  String difference() {
    clock = clock! + DateTime.now().difference(start!) ;
    String time = clock.toString();
    return time.substring(0, time.length-4);
  }

  @override
  String toString() {
    return start.toString();
  }

  DateTime? getStop() {
    return stop;
  }

  DateTime? getStart() {
    return start;
  }
}
