

import requests
import re
import os

def download_file(url, filename):
    response = requests.get(url)
    if response.status_code == 200:
        with open(filename, 'wb') as file:
            file.write(response.content)
        print(f"File '{filename}' downloaded successfully.")
    else:
        print(f"Failed to download file from '{url}'.")


def modify_file(filename):
    with open(filename, 'r') as file:
        lines = file.readlines()

    with open(filename, 'w') as file:
        for line in lines:
            if '}' in line and '};' not in line:  # Modifica solo líneas que contengan '}'
                line = line.replace('}.', '}\n.')

            file.write(line)


def read_css_file(css_filename):
    classes_with_icons = {}
    with open(css_filename, 'r') as file:
        for line in file:
            line = line.strip()
            if line.startswith('.nf-'):
                class_name_match = re.search(r'\.([a-zA-Z0-9_-]+):before', line)
                icon_code_match = re.search(r'\\([a-fA-F0-9]+)', line)

                if class_name_match and icon_code_match:
                    class_name = class_name_match.group(1)
                    icon_code = icon_code_match.group(1)

                    # class_name, icon_code = line.split(':before {')[0].split('.nf-')[-1].split('before {')[0].strip(), line.split('{')[-1].strip().strip('"').strip("'}")
                    classes_with_icons[class_name] = icon_code
    return classes_with_icons

def generate_dart_code(classes_with_icons):
    dart_code = """// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/widgets.dart';

// [IconData] for a font Nerd Font brand icon from a code point
///
/// Code points can be obtained from nerdfonts.com
class NFIconData extends IconData {
  const NFIconData(int codePoint)
      : super(
          codePoint,
          fontFamily: "NFH Regular",
          fontPackage: "tdtx_nf_icons",
        );
}

"""

    dart_code += '\tfinal Map<String, NFIconData> _icons = {\n'
    for class_name, icon_code in classes_with_icons.items():
        dart_code += f'\t\t\'{class_name}\': const NFIconData(0x{icon_code}),\n '
    dart_code +='\n};\n\n'


    dart_code += 'class TDTxNFIcons {\n\tstatic NFIconData fromCLass(String clase) => _icons[clase]!;\n'

    for class_name, icon_code in classes_with_icons.items():
        class_name2 = class_name.replace("-", "_")
        dart_code += f'\tstatic final IconData {class_name2} = _icons[\'{class_name}\']!;\n '
    dart_code +='\n}'

    return dart_code

def save_to_file(content, filename):
    with open(filename, 'w') as file:
        file.write(content)


if __name__ == "__main__":
    url = "https://www.nerdfonts.com/assets/css/webfont.css"  # URL del archivo a descargar
    css_filename = "nerdfond.css"  # Nombre de archivo en el que se guardará el archivo descargado
    dart_filename = "lib/tdtx_nf_icons.dart"  # Nombre del archivo Dart generado

    download_file(url, css_filename)
    modify_file(css_filename)

    classes_with_icons = read_css_file(css_filename)
    dart_code = generate_dart_code(classes_with_icons)
    save_to_file(dart_code, dart_filename)
    os.remove(css_filename)
    print(f"Generated {dart_filename} successfully.")
