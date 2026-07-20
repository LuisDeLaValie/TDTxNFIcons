import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdtx_nf_icons/tdtx_nf_icons_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelTdtxNfIcons platform = MethodChannelTdtxNfIcons();
  const MethodChannel channel = MethodChannel('tdtx_nf_icons');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
