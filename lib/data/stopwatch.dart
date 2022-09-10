class Stopwatch {
  DateTime? start;
  late List<DateTime> rounds;
  DateTime? end;

  Stopwatch();

  void setStart() {
    start = DateTime.now();
    end = null;
  }

  void setStop() {
    end = DateTime.now();
  }

  void round() {
    rounds.add(DateTime.now());
  }

  String difference() {
    String time = DateTime.now().difference(start!).toString();
    return time.substring(0, time.length-4);
  }

  @override
  String toString() {
    return start.toString();
  }

  DateTime? getEnd() {
    return end;
  }

  DateTime? getStart() {
    return start;
  }
}
