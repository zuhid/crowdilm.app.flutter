import 'dart:ui';

class Settings {
  Map<String, String> mapSetting;

  Settings(this.mapSetting);

  Color get fontColor {
    var fontColors = mapSetting['fontColor']?.split(',').map((x) => int.parse(x)).toList() ?? [];
    return Color.fromARGB(fontColors[0], fontColors[1], fontColors[2], fontColors[3]);
  }

  Color get backgroundColor {
    var fontColors = mapSetting['backgroundColor']?.split(',').map((x) => int.parse(x)).toList() ?? [];
    return Color.fromARGB(fontColors[0], fontColors[1], fontColors[2], fontColors[3]);
  }

  Color get offsetBackgroundColor {
    var fontColors = mapSetting['offsetBackgroundColor']?.split(',').map((x) => int.parse(x)).toList() ?? [];
    return Color.fromARGB(fontColors[0], fontColors[1], fontColors[2], fontColors[3]);
  }
}
