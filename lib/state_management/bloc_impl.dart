import 'dart:async';

import 'package:flutter/material.dart';

abstract class BlocBase<S> {
  S get state;

  Stream<S> get stream;

  void dispose();
}

class _BlocProviderInherited<B extends BlocBase<Object?>>
    extends InheritedWidget {
  final B bloc;

  const _BlocProviderInherited({
    super.key,
    required super.child,
    required this.bloc,
  });

  @override
  bool updateShouldNotify(covariant _BlocProviderInherited<B> oldWidget) {
    return oldWidget.bloc != bloc;
  }
}

abstract class BlocBuilderBase<B extends BlocBase<S>, S>
    extends StatefulWidget {
  const BlocBuilderBase({super.key, this.bloc, this.buildWhen});

  final B? bloc;
  final bool Function(S previous, S current)? buildWhen;

  Widget build(BuildContext context, S state);

  @override
  State<BlocBuilderBase<B, S>> createState() => _BlocBuilderBaseState<B, S>();
}

class _BlocBuilderBaseState<B extends BlocBase<S>, S>
    extends State<BlocBuilderBase<B, S>> {
  late B _bloc;
  late S _state;
  StreamSubscription<S>? _subscription;

  @override
  void initState() {
    super.initState();

    _bloc =
        widget.bloc ??
        context
            .dependOnInheritedWidgetOfExactType<_BlocProviderInherited<B>>()!
            .bloc;
    _state = _bloc.state;
    _subscribe();
  }

  void _subscribe() {
    _subscription = _bloc.stream.listen((S newState) {
      if (widget.buildWhen?.call(_state, newState) ?? true) {
        setState(() {
          _state = newState;
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, _state);
}
