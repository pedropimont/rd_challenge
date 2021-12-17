import 'package:flutter/material.dart';

import 'app.dart';
import 'repositories/cache/cache_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cacheRepository = await CacheRepository.getInstance();

  runApp(App(cacheRepository: cacheRepository));
}
