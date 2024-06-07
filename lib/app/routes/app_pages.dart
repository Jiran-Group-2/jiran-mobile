import 'package:get/get.dart';

import '../modules/announcement/bindings/announcement_binding.dart';
import '../modules/announcement/views/announcement_view.dart';
import '../modules/announcement_detail/bindings/announcement_detail_binding.dart';
import '../modules/announcement_detail/views/announcement_detail_view.dart';
import '../modules/bills/bindings/bills_binding.dart';
import '../modules/bills/views/bills_view.dart';
import '../modules/bills_detail/bindings/bills_detail_binding.dart';
import '../modules/bills_detail/views/bills_detail_view.dart';
import '../modules/complaint/bindings/complaint_binding.dart';
import '../modules/complaint/views/complaint_view.dart';
import '../modules/complaint_add/bindings/complaint_add_binding.dart';
import '../modules/complaint_add/views/complaint_add_view.dart';
import '../modules/complaint_detail/bindings/complaint_detail_binding.dart';
import '../modules/complaint_detail/views/complaint_detail_view.dart';
import '../modules/guard/bindings/guard_binding.dart';
import '../modules/guard/guard_home/bindings/guard_home_binding.dart';
import '../modules/guard/guard_home/views/guard_home_view.dart';
import '../modules/guard/guard_visitor/bindings/guard_visitor_binding.dart';
import '../modules/guard/guard_visitor/views/guard_visitor_view.dart';
import '../modules/guard/guard_visitor_details/bindings/guard_visitor_details_binding.dart';
import '../modules/guard/guard_visitor_details/views/guard_visitor_details_view.dart';
import '../modules/guard/guard_visitor_scan/bindings/guard_visitor_scan_binding.dart';
import '../modules/guard/guard_visitor_scan/views/guard_visitor_scan_view.dart';
import '../modules/guard/views/guard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pay_sim_amount/bindings/pay_sim_amount_binding.dart';
import '../modules/pay_sim_amount/views/pay_sim_amount_view.dart';
import '../modules/visitor/bindings/visitor_binding.dart';
import '../modules/visitor/views/visitor_view.dart';
import '../modules/visitor_add/bindings/visitor_add_binding.dart';
import '../modules/visitor_add/views/visitor_add_view.dart';
import '../modules/visitor_detail/bindings/visitor_detail_binding.dart';
import '../modules/visitor_detail/views/visitor_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VISITOR,
      page: () => const VisitorView(),
      binding: VisitorBinding(),
    ),
    GetPage(
      name: _Paths.BILLS,
      page: () => const BillsView(),
      binding: BillsBinding(),
    ),
    GetPage(
      name: _Paths.ANNOUNCEMENT,
      page: () => const AnnouncementView(),
      binding: AnnouncementBinding(),
    ),
    GetPage(
      name: _Paths.COMPLAINT,
      page: () => const ComplaintView(),
      binding: ComplaintBinding(),
    ),
    GetPage(
      name: _Paths.BILLS_DETAIL,
      page: () => const BillsDetailView(),
      binding: BillsDetailBinding(),
    ),
    GetPage(
      name: _Paths.VISITOR_DETAIL,
      page: () => const VisitorDetailView(),
      binding: VisitorDetailBinding(),
    ),
    GetPage(
      name: _Paths.ANNOUNCEMENT_DETAIL,
      page: () => const AnnouncementDetailView(),
      binding: AnnouncementDetailBinding(),
    ),
    GetPage(
      name: _Paths.COMPLAINT_DETAIL,
      page: () => const ComplaintDetailView(),
      binding: ComplaintDetailBinding(),
    ),
    GetPage(
      name: _Paths.COMPLAINT_ADD,
      page: () => const ComplaintAddView(),
      binding: ComplaintAddBinding(),
    ),
    GetPage(
      name: _Paths.VISITOR_ADD,
      page: () => const VisitorAddView(),
      binding: VisitorAddBinding(),
    ),
    GetPage(
      name: _Paths.PAY_SIM_AMOUNT,
      page: () => const PaySimAmountView(),
      binding: PaySimAmountBinding(),
    ),
    GetPage(
      name: _Paths.GUARD,
      page: () => const GuardView(),
      binding: GuardBinding(),
      children: [
        GetPage(
          name: _Paths.GUARD_HOME,
          page: () => const GuardHomeView(),
          binding: GuardHomeBinding(),
        ),
        GetPage(
          name: _Paths.GUARD_VISITOR,
          page: () => const GuardVisitorView(),
          binding: GuardVisitorBinding(),
        ),
        GetPage(
          name: _Paths.GUARD_VISITOR_SCAN,
          page: () => const GuardVisitorScanView(),
          binding: GuardVisitorScanBinding(),
        ),
        GetPage(
          name: _Paths.GUARD_VISITOR_DETAILS,
          page: () => const GuardVisitorDetailsView(),
          binding: GuardVisitorDetailsBinding(),
        ),
      ],
    ),
  ];
}
