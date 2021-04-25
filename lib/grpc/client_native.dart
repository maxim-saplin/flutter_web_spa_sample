import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';

ClientChannelBase getGrpcClientChannel(String host, int port, bool useHttps) {
  return ClientChannel(
    host,
    port: port,
    options: ChannelOptions(
        credentials: useHttps
            ? ChannelCredentials.secure()
            : ChannelCredentials.insecure()),
  );
}
