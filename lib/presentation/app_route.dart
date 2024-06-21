import 'package:flutter_test21jun/common/app_const.dart';
import 'package:get/get.dart';

import 'binding/bindings.dart';
import 'view/views.dart';

List<GetPage<dynamic>> get setRoute => [
      GetPage(
        name: initialRoute,
        page: () => const PostView(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 100),
        bindings: [PostBinding()],
      ),
      GetPage(
        name: detailRoute,
        page: () => const DetailView(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 100),
        bindings: [DetailBinding()],
      ),
    ];
