///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat.pb.dart' as $0;
export 'chat.pb.dart';

class SamChatClient extends $grpc.Client {
  static final _$complete =
      $grpc.ClientMethod<$0.CompleteRequest, $0.CompleteResponse>(
          '/myservice.SamChat/Complete',
          ($0.CompleteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CompleteResponse.fromBuffer(value));

  SamChatClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CompleteResponse> complete($0.CompleteRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$complete, request, options: options);
  }
}

abstract class SamChatServiceBase extends $grpc.Service {
  $core.String get $name => 'myservice.SamChat';

  SamChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CompleteRequest, $0.CompleteResponse>(
        'Complete',
        complete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CompleteRequest.fromBuffer(value),
        ($0.CompleteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CompleteResponse> complete_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CompleteRequest> request) async {
    return complete(call, await request);
  }

  $async.Future<$0.CompleteResponse> complete(
      $grpc.ServiceCall call, $0.CompleteRequest request);
}
