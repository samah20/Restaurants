class Durationing {
  bool isSelcted = false;
  final String title;
  final int value;

  Durationing({
    this.isSelcted = false,
    this.title,
    this.value,
    int milliseconds,
  });
}

List<Durationing> duration = [
  Durationing(isSelcted: true, title: "1 hr", value: 1),
  Durationing(title: "1 hr", value: 1),
  Durationing(title: "4 hr", value: 4),
  Durationing(title: "8 hr", value: 8),
  Durationing(title: "12 hr", value: 12),
];
