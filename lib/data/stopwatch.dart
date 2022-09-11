class Stopwatch {
  DateTime? start;
  DateTime? stop;
  List<Duration> rounds = [];
  Duration clock = const Duration();

  Stopwatch();

  void setStart() {
    start = DateTime.now();
    stop = null;
  }

  void setStop() {
    stop = DateTime.now();
  }

  void setRound() {
    rounds.add(DateTime.now().difference(start!));
  }

  List getRounds() {
    return rounds;
  }

  String difference() {
    clock = clock + DateTime.now().difference(start!) ;
    String time = clock.toString();
    return time.substring(0, time.length-4);
  }

  void reset() {
    start = null;
    stop = null;
    rounds = [];
    clock = const Duration();
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
