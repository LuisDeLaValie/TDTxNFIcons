import 'package:flutter_test/flutter_test.dart';
import 'package:tdtx_nf_icons/tdtx_nf_icons.dart';
import 'package:tdtx_nf_icons/tdtx_nf_icons_platform_interface.dart';
import 'package:tdtx_nf_icons/tdtx_nf_icons_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTdtxNfIconsPlatform
    with MockPlatformInterfaceMixin
    implements TdtxNfIconsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TdtxNfIconsPlatform initialPlatform = TdtxNfIconsPlatform.instance;

  test('$MethodChannelTdtxNfIcons is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTdtxNfIcons>());
  });

  test('getPlatformVersion', () async {
    TdtxNfIcons tdtxNfIconsPlugin = TdtxNfIcons();
    MockTdtxNfIconsPlatform fakePlatform = MockTdtxNfIconsPlatform();
    TdtxNfIconsPlatform.instance = fakePlatform;

    expect(await tdtxNfIconsPlugin.getPlatformVersion(), '42');
  });
}
