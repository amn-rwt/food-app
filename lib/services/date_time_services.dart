import 'package:ntp/ntp.dart';

class DateTimeServices {
  static Future<DateTime> checkTime() async {
    DateTime myTime;
    DateTime ntpTime;

    /// Or you could get NTP current (It will call DateTime.now() and add NTP offset to it)
    myTime = DateTime.now();

    final int offset = await NTP.getNtpOffset(
        localTime: myTime, lookUpAddress: 'time.google.com');

    ntpTime = myTime.add(Duration(milliseconds: offset));

    return ntpTime;
  }
}
