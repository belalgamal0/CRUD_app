

import 'dart:html' as html;
abstract class NetworkInfo {
  bool? get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final html.Navigator connectionChecker;

  NetworkInfoImpl(this.connectionChecker);
  @override
  bool? get isConnected => connectionChecker.onLine;
}