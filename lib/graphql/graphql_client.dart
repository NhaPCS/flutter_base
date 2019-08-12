import 'package:graphql/client.dart';
import 'dart:io';
import 'package:device_info/device_info.dart';

class Client {
  Client._();

  static final Client client = Client._();

  GraphQLClient _graphQLClient;

  GraphQLClient get graphQLClient {
    if (_graphQLClient == null) {
      _graphQLClient = getClient();
    }
    return _graphQLClient;
  }

  GraphQLClient getClient() {
    final HttpLink _httpLink = HttpLink(
      uri: 'http://45.76.180.15:9000/graphql',
    );

    final AuthLink _authLink = AuthLink(
      getToken: () async => getTokenId(),
    );

    final Link _link = _authLink.concat(_httpLink as Link);

    return GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );
  }

  Future<String> getTokenId() async {
    String token = "";
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      token= build.androidId;
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      token= data.identifierForVendor;
    }
    print("DEVICE ID $token");
    return token;
  }
}
