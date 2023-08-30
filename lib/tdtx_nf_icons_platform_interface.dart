import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tdtx_nf_icons_method_channel.dart';

abstract class TdtxNfIconsPlatform extends PlatformInterface {
  /// Constructs a TdtxNfIconsPlatform.
  TdtxNfIconsPlatform() : super(token: _token);

  static final Object _token = Object();

  static TdtxNfIconsPlatform _instance = MethodChannelTdtxNfIcons();

  /// The default instance of [TdtxNfIconsPlatform] to use.
  ///
  /// Defaults to [MethodChannelTdtxNfIcons].
  static TdtxNfIconsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TdtxNfIconsPlatform] when
  /// they register themselves.
  static set instance(TdtxNfIconsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
