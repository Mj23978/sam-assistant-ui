import 'dart:async';

import 'package:grpc/grpc.dart';

import '../../utils/session.dart';

class TokenGrpcInterceptor implements ClientInterceptor {
  @override
  ResponseStream<R> interceptStreaming<Q, R>(
      ClientMethod<Q, R> method,
      Stream<Q> requests,
      CallOptions options,
      ClientStreamingInvoker<Q, R> invoker) {
    var newOpts = options.mergedWith(
      CallOptions(
        metadata: {
          'Authorization': 'Bearer ${UserSession.kAccessToken}',
          'x-language-id': '${UserSession.kLocale}',
          'x-authenticated': '${UserSession.kIsLoggedIn}',
        },
      ),
    );
    // do nothing for now
    return invoker(method, requests, newOpts);
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q self,
      CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    var newOpts = options.mergedWith(
      CallOptions(
        metadata: {
          'Authorization': 'Bearer ${UserSession.kAccessToken}',
          'x-language-id': '${UserSession.kLocale}',
          'x-authenticated': '${UserSession.kIsLoggedIn}',
        },
      ),
    );
    return invoker(method, self, newOpts);
  }
}
