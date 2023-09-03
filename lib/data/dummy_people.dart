import 'dart:math';

class DummyPerson {
  final String name;
  final String surname;
  final String relationship;

  DummyPerson(
      {required this.name, required this.surname, required this.relationship});
}

DateTime generateRandomDateTime() {
  final random = Random();

  final year = random.nextInt(100) + 1900; // Random year between 1900 and 1999
  final month = random.nextInt(12) + 1; // Random month between 1 and 12
  final day = random.nextInt(31) + 1; // Random day between 1 and 31
  final hour = random.nextInt(24); // Random hour between 0 and 23
  final minute = random.nextInt(60); // Random minute between 0 and 59
  final second = random.nextInt(60); // Random second between 0 and 59
  final millisecond =
      random.nextInt(1000); // Random millisecond between 0 and 999

  return DateTime(
    year,
    month,
    day,
    hour,
    minute,
    second,
    millisecond,
  );
}

String generateRandomDateTimeString() {
  final random = Random();

  final year =
      2023; //random.nextInt(100) + 2000; // Random year between 1900 and 1999
  final month = random.nextInt(12) + 1; // Random month between 1 and 12
  final day = random.nextInt(31) + 1; // Random day between 1 and 31
  final hour = random.nextInt(24); // Random hour between 0 and 23
  final minute = random.nextInt(60); // Random minute between 0 and 59
  final second = random.nextInt(60); // Random second between 0 and 59

  // Format the components into the desired string format
  final formattedDate =
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')} '
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';

  return formattedDate;
}
