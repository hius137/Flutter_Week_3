class ApiModel {
  ApiModel({
      this.abbreviation, 
      this.clientIp, 
      this.datetime, 
      this.dayOfWeek, 
      this.dayOfYear, 
      this.dst, 
      this.dstFrom, 
      this.dstOffset, 
      this.dstUntil, 
      this.rawOffset, 
      this.timezone, 
      this.unixtime, 
      this.utcDatetime, 
      this.utcOffset, 
      this.weekNumber,});

  ApiModel.fromJson(dynamic json) {
    abbreviation = json['abbreviation'];
    clientIp = json['client_ip'];
    datetime = json['datetime'];
    dayOfWeek = json['day_of_week'];
    dayOfYear = json['day_of_year'];
    dst = json['dst'];
    dstFrom = json['dst_from'];
    dstOffset = json['dst_offset'];
    dstUntil = json['dst_until'];
    rawOffset = json['raw_offset'];
    timezone = json['timezone'];
    unixtime = json['unixtime'];
    utcDatetime = json['utc_datetime'];
    utcOffset = json['utc_offset'];
    weekNumber = json['week_number'];
  }
  String? abbreviation;
  String? clientIp;
  String? datetime;
  num? dayOfWeek;
  num? dayOfYear;
  bool? dst;
  dynamic dstFrom;
  num? dstOffset;
  dynamic dstUntil;
  num? rawOffset;
  String? timezone;
  num? unixtime;
  String? utcDatetime;
  String? utcOffset;
  num? weekNumber;
ApiModel copyWith({  String? abbreviation,
  String? clientIp,
  String? datetime,
  num? dayOfWeek,
  num? dayOfYear,
  bool? dst,
  dynamic dstFrom,
  num? dstOffset,
  dynamic dstUntil,
  num? rawOffset,
  String? timezone,
  num? unixtime,
  String? utcDatetime,
  String? utcOffset,
  num? weekNumber,
}) => ApiModel(  abbreviation: abbreviation ?? this.abbreviation,
  clientIp: clientIp ?? this.clientIp,
  datetime: datetime ?? this.datetime,
  dayOfWeek: dayOfWeek ?? this.dayOfWeek,
  dayOfYear: dayOfYear ?? this.dayOfYear,
  dst: dst ?? this.dst,
  dstFrom: dstFrom ?? this.dstFrom,
  dstOffset: dstOffset ?? this.dstOffset,
  dstUntil: dstUntil ?? this.dstUntil,
  rawOffset: rawOffset ?? this.rawOffset,
  timezone: timezone ?? this.timezone,
  unixtime: unixtime ?? this.unixtime,
  utcDatetime: utcDatetime ?? this.utcDatetime,
  utcOffset: utcOffset ?? this.utcOffset,
  weekNumber: weekNumber ?? this.weekNumber,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['abbreviation'] = abbreviation;
    map['client_ip'] = clientIp;
    map['datetime'] = datetime;
    map['day_of_week'] = dayOfWeek;
    map['day_of_year'] = dayOfYear;
    map['dst'] = dst;
    map['dst_from'] = dstFrom;
    map['dst_offset'] = dstOffset;
    map['dst_until'] = dstUntil;
    map['raw_offset'] = rawOffset;
    map['timezone'] = timezone;
    map['unixtime'] = unixtime;
    map['utc_datetime'] = utcDatetime;
    map['utc_offset'] = utcOffset;
    map['week_number'] = weekNumber;
    return map;
  }

}