import 'package:grpc/grpc.dart';

import '../../utils/helpers.dart';

class LogGrpcInterceptor implements ClientInterceptor {
  @override
  ResponseStream<R> interceptStreaming<Q, R>(
      ClientMethod<Q, R> method,
      Stream<Q> requests,
      CallOptions options,
      ClientStreamingInvoker<Q, R> invoker) {
    logger.d(
        'grpc streaming method: ${method.path} => metadata: ${options.metadata} => payload : $requests');
    // do nothing for now
    return invoker(method, requests, options)
      ..map((data) {
        logger.d('grpc stream response => $data');
        return data;
      });
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q self,
      CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    logger.d(
        'grpc unary method: ${method.path} => metadata: ${options.metadata} => payload : $self');
    return invoker(method, self, options)
      ..then((data) => logger.d('grpc unary response => $data'));
  }
}
