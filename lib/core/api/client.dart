import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';

import '../../generated/chat.pbgrpc.dart';
import 'log.intercepter.dart';
import 'token.intercepter.dart';

class NetworkConfigModule {
  final _logInterceptor = LogGrpcInterceptor();
  final _tokenInterceptor = TokenGrpcInterceptor();

  ClientChannel _createChannel(int port, [String? host = '127.0.0.1']) =>
      ClientChannel(
        host ?? '0.0.0.0',
        port: port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()),
      );

  SamChatClient get samChatClient => SamChatClient(
      _createChannel(int.parse(dotenv.env['SAM_SERVER_PORT'].toString()),
          dotenv.env['SAM_SERVER_URL']),
      interceptors: [_tokenInterceptor, _logInterceptor]);

}
