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
    if (rounds.isEmpty) {
      rounds.add(DateTime.now().difference(start!));
      return;
    }
    if (clock == '0:00:00.000000') {
     rounds.add(DateTime.now().difference(start!) - rounds.last);
     return;
    }
    Duration timeBefore = Duration();
    for (Duration round in rounds) {
      timeBefore += round;
    }
    rounds.add(DateTime.now().difference(start!)+clock-timeBefore);
  }

  List getRounds() {
    return rounds;
  }

  String difference() {
    Duration dur = clock + DateTime.now().difference(start!);
    String time = dur.toString();
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
