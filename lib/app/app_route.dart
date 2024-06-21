import 'package:flutter_test21jun/app/app_const.dart';
import 'package:get/get.dart';

import '../presentation/binding/bindings.dart';
import '../presentation/view/views.dart';

List<GetPage<dynamic>> get setRoute => [
      GetPage(
        name: initialRoute,
        page: () => const PostView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
        bindings: [PostBinding()],
      ),
      GetPage(
        name: detailRoute,
        page: () => const DetailView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 250),
        bindings: [DetailBinding()],
      ),
    ];
