import 'package:datacraftz_mobile/views/screen/page/base_page.dart';
import 'package:datacraftz_mobile/views/screen/page/booking_bill_page.dart';
import 'package:datacraftz_mobile/views/screen/page/check_ticket.dart';
import 'package:datacraftz_mobile/views/screen/page/check_ticket_done_page.dart';
import 'package:datacraftz_mobile/views/screen/page/conductor/base_conductor_page.dart';
import 'package:datacraftz_mobile/views/screen/page/conductor/check_ticket_conductor_page.dart';
import 'package:datacraftz_mobile/views/screen/page/conductor/profile_conductor_page.dart';
import 'package:datacraftz_mobile/views/screen/page/driver/base_page_driver.dart';
import 'package:datacraftz_mobile/views/screen/page/driver/profile_driver_page.dart';
import 'package:datacraftz_mobile/views/screen/page/edit_profile_page.dart';
import 'package:datacraftz_mobile/views/screen/page/go_station_page.dart';
import 'package:datacraftz_mobile/views/screen/page/login_page.dart';
import 'package:datacraftz_mobile/views/screen/page/rating_driver_page.dart';
import 'package:datacraftz_mobile/views/screen/page/register_page.dart';
import 'package:datacraftz_mobile/views/screen/page/splash_page.dart';
import 'package:datacraftz_mobile/views/screen/page/to_station_page.dart';
import 'package:datacraftz_mobile/views/screen/page/payment_ticket_page.dart';

dynamic routes = {
  //User
  SplashScreenPage.routeName: (context) => const SplashScreenPage(),
  BasePage.routeName: (context) => const BasePage(),
  LoginPage.routeName: (context) => const LoginPage(),
  RegisterPage.routeName: (context) => const RegisterPage(),
  GoStationPage.routeName: (context) => const GoStationPage(),
  ToStationPage.routeName: (context) => const ToStationPage(),
  CheckTicketPage.routeName: (context) => const CheckTicketPage(),
  CheckTicketDonePage.routeName: (context) => const CheckTicketDonePage(),
  BookingBillPage.routeName: (context) => const BookingBillPage(),
  RatingDriverPage.routeName: (context) => const RatingDriverPage(),
  PaymentTicketPage.routeName: (context) => const PaymentTicketPage(),
  EditProfilePage.routeName: (context) => const EditProfilePage(),
  // Driver
  BaseDriverPage.routeName: (context) => const BaseDriverPage(),
  ProfileDriverPage.routeName: (context) => const ProfileDriverPage(),
  // Conductor
  ProfileConductorPage.routeName: (context) => const ProfileConductorPage(),
  BaseConductorPage.routeName: (context) => const BaseConductorPage(),
  CheckTicketConductorPage.routeName: (context) =>
      const CheckTicketConductorPage(),
};
