import 'dart:typed_data';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class MockAdapter extends HttpClientAdapter {
  MockAdapter({required this.mockMethod});

  static const String mockHost = 'mockserver';
  static const String mockBase = 'http://$mockHost';
  final DefaultHttpClientAdapter _adapter = DefaultHttpClientAdapter();

  final Future<ResponseBody> Function(String path) mockMethod;

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<Uint8List>? requestStream, Future? cancelFuture) async {
    final uri = options.uri;
    if (uri.host == mockHost) {
      return mockMethod(uri.path);
    }
    return _adapter.fetch(options, requestStream, cancelFuture);
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}
