import 'package:grpc/grpc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final grpcChannelProvider = Provider<ClientChannel>((ref) {
  // ClientChannelのインスタンス。
  final channel = ClientChannel(
    'localhost', 
    port: 8081, 
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  // Providerがdisposeされるときにchannelをシャットダウン。
  ref.onDispose(() => channel.shutdown());

  return channel;
});
