import 'dart:async';

import 'package:lilac_machine_test/data/repository.dart';
import 'package:lilac_machine_test/feateres/requirements/model/requirements_model.dart';
import 'package:riverpod/riverpod.dart';

class RequirementNotifier extends AsyncNotifier<List<VenderRequirements>> {
  @override
  Future<List<VenderRequirements>> build() {
    return fetchRequirements();
  }

  Future<List<VenderRequirements>> fetchRequirements() async {
    state = const AsyncValue.loading();
    try {
      List<VenderRequirements> data = await ApiHelper.getRequirements();
      state = AsyncValue.data(data);

      return data;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      throw Exception(e);
    }
  }
}

var requirementProvider =
    AsyncNotifierProvider<RequirementNotifier, List<VenderRequirements>>(
  () => RequirementNotifier(),
);
