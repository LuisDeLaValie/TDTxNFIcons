#ifndef FLUTTER_PLUGIN_TDTX_NF_ICONS_PLUGIN_H_
#define FLUTTER_PLUGIN_TDTX_NF_ICONS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace tdtx_nf_icons {

class TdtxNfIconsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  TdtxNfIconsPlugin();

  virtual ~TdtxNfIconsPlugin();

  // Disallow copy and assign.
  TdtxNfIconsPlugin(const TdtxNfIconsPlugin&) = delete;
  TdtxNfIconsPlugin& operator=(const TdtxNfIconsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace tdtx_nf_icons

#endif  // FLUTTER_PLUGIN_TDTX_NF_ICONS_PLUGIN_H_
