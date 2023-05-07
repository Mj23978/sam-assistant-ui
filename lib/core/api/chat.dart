import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';

import '../../generated/chat.pbgrpc.dart';

class ChatServiceGRPC {
  final SamChatClient client;

  ChatServiceGRPC(this.client);

  Future<Either<CompleteResponse, String>> sendMessage(
      CompleteRequest request) async {
    try {
      var response = await client.complete(request);
      return left(response);
    } on GrpcError catch (e) {
      return right(e.message ?? e.codeName);
    }
  }
}