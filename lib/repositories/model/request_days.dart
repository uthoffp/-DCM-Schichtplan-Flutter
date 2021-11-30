class RequestDays {
  num open;
  num corrections;
  num prevYear;
  num remaining;
  num taken;
  num thisRequest;
  num thisYear;
  num total;

  RequestDays(
      {required this.open,
      required this.corrections,
      required this.prevYear,
      required this.remaining,
      required this.taken,
      required this.thisRequest,
      required this.thisYear,
      required this.total});

  factory RequestDays.fromJson(Map<String, dynamic> json) {
    return RequestDays(
      open: json['open'],
      corrections: json['corrections'],
      prevYear: json['prevYear'],
      remaining: json['remaining'],
      taken: json['taken'],
      thisRequest: json['thisRequest'],
      thisYear: json['thisYear'],
      total: json['total'],
    );
  }
}