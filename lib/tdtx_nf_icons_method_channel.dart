import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tdtx_nf_icons_platform_interface.dart';

/// An implementation of [TdtxNfIconsPlatform] that uses method channels.
class MethodChannelTdtxNfIcons extends TdtxNfIconsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tdtx_nf_icons');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
