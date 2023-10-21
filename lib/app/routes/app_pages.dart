import 'package:get/get.dart';
import 'package:snapwork_assignment/app/modules/create%20event/bindings/customer_bindings.dart';
import 'package:snapwork_assignment/app/modules/create%20event/view/create_event_page.dart';

import '../modules/home/bindings/home_bindings.dart';
import '../modules/home/view/home_page.dart';

part 'app_routes.dart';

class AppPages {
  const AppPages._();
  static final routes = [
    GetPage(
        name: Routes.CREATE_EVENT,
        page: () => const CreateEventPage(),
        bindings: [CreateEventBinding()]),
    GetPage(
        name: Routes.HOME_PAGE,
        page: () => const HomePage(),
        binding: HomeBinding()),
  ];
}
