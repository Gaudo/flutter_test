// worker Saga: will be fired on UserFetchRequested actions
import 'package:redux_saga/redux_saga.dart';
import 'package:social_app/src/application/actions.dart';

Iterable<void> fetchUser(SaErrorDetails action) sync* {}

Iterable<void> mySaga() sync* {
  yield TakeEvery(fetchUser, pattern: SaErrorDetails);
}
