#include "include/tdtx_nf_icons/tdtx_nf_icons_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "tdtx_nf_icons_plugin.h"

void TdtxNfIconsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  tdtx_nf_icons::TdtxNfIconsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
