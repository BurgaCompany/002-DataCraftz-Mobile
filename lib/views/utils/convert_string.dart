String getDayOfWeek(int day) {
  String dayOfWeek;

  switch (day) {
    case 1:
      dayOfWeek = 'Senin';
      break;
    case 2:
      dayOfWeek = 'Selasa';
      break;
    case 3:
      dayOfWeek = 'Rabu';
      break;
    case 4:
      dayOfWeek = 'Kamis';
      break;
    case 5:
      dayOfWeek = 'Jumat';
      break;
    case 6:
      dayOfWeek = 'Sabtu';
      break;
    case 7:
      dayOfWeek = 'Minggu';
      break;
    default:
      dayOfWeek = 'Hari tidak valid';
  }

  return dayOfWeek;
}

String getMonth(int month) {
  String monthName;

  switch (month) {
    case 1:
      monthName = 'Januari';
      break;
    case 2:
      monthName = 'Februari';
      break;
    case 3:
      monthName = 'Maret';
      break;
    case 4:
      monthName = 'April';
      break;
    case 5:
      monthName = 'Mei';
      break;
    case 6:
      monthName = 'Juni';
      break;
    case 7:
      monthName = 'Juli';
      break;
    case 8:
      monthName = 'Agustus';
      break;
    case 9:
      monthName = 'September';
      break;
    case 10:
      monthName = 'Oktober';
      break;
    case 11:
      monthName = 'November';
      break;
    case 12:
      monthName = 'Desember';
      break;
    default:
      monthName = 'Bulan tidak valid';
  }

  return monthName;
}

String greetings() {
  var hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Selamat Pagi';
  } else if (hour < 17) {
    return 'Selamat Siang';
  } else {
    return 'Selamat Malam';
  }
}


String createDataBill(String input) {
  return input.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
}