import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordVisibilityProvider = StateProvider<bool>((ref) => false);

final loadingProvider = StateProvider.autoDispose<bool>(
  (ref) {
    return false;
  },
);
final indexProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);
