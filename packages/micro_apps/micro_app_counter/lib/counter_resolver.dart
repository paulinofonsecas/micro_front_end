import 'package:micro_app_counter/core/inject/inject.dart';
import 'package:micro_app_counter/presentation/pages/counter_page.dart';
import 'package:micro_core/micro_core.dart';

class MicroAppCounterResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_counter';

  @override
  void Function() get injectionsRegister => Inject.inject;

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/counter': (context, args) => const CounterPage(),
      };
}
