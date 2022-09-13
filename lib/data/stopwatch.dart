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
    setRound();
  }

  Duration runningTime() {
    if (rounds.isEmpty) {
      return DateTime.now().difference(start!);
    }
    if (clock == '0:00:00.000000') {
      return DateTime.now().difference(start!) - rounds.last;
    }
    Duration timeBefore = const Duration();
    for (Duration round in rounds) {
      timeBefore += round;
    }
    return DateTime.now().difference(start!) + clock - timeBefore;
  }

  void setRound() {
    rounds.add(runningTime());
  }

  List getRounds() {
    return rounds;
  }

  String difference() {
    Duration dur = clock + DateTime.now().difference(start!);
    String time = dur.toString();
    return time.substring(0, time.length - 4);
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
