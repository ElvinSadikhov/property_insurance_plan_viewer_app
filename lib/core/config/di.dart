// Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'di.config.dart';

const _development = 'development';
const _staging = 'staging';
const _production = 'production';

enum Flavor {
  dev(_development),
  staging(_staging),
  prod(_production);

  const Flavor(this._flavor);

  final String _flavor;
}

const devEnv = Environment(_development);
const stagingEnv = Environment(_staging);
const productionEnv = Environment(_production);

@InjectableInit()
Future<void> configureDependencies(Flavor flavor) async => GetIt.instance.init(environment: flavor._flavor,);
