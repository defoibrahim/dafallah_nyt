

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements INetworkInfo {
  final InternetConnectionChecker dataConnectionChecker;
  NetworkInfoImpl(this.dataConnectionChecker);
  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
