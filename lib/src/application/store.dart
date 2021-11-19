import 'package:redux/redux.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:social_app/src/application/actions.dart';
import 'package:social_app/src/application/reducer.dart';
import 'package:social_app/src/application/sagas.dart';
import 'package:social_app/src/application/state.dart';

class SaStore extends Store<SaState> {
  SaStore(
    Reducer<SaState> reducer, {
    required SaState initialState,
    List<Middleware<SaState>> middleware = const [],
  }) : super(
          reducer,
          initialState: initialState,
          middleware: middleware,
          distinct: true,
        );

  @override
  void dispatch(covariant SaAction action) {
    super.dispatch(action);
  }
}

SaStore createStore() {
  var sagaMiddleware = createSagaMiddleware();

  final store = SaStore(
    reducer,
    initialState: const SaState(0),
    middleware: [
      applyMiddleware(sagaMiddleware),
    ],
  );

  sagaMiddleware.setStore(store);

  sagaMiddleware.run(mySaga);

  return store;
}
