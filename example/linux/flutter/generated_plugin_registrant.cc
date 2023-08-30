//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <tdtx_nf_icons/tdtx_nf_icons_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) tdtx_nf_icons_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "TdtxNfIconsPlugin");
  tdtx_nf_icons_plugin_register_with_registrar(tdtx_nf_icons_registrar);
}
