import 'package:social_app/src/application/state.dart';

SaState reducer(SaState state, dynamic action) {
  return SaState(state.value + 1);
}
