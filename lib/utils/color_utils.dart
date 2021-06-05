import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:random_color/random_color.dart';
import 'package:split_the_bill/utils/debugging.dart';

class ColorUtils {

  static RandomColor _randomColor = RandomColor();

  static List<double> rgbToHSV(List<int> rgb) {
    double r = rgb[0] / 255.0;
    double g = rgb[1] / 255.0;
    double b = rgb[2] / 255.0;

    double cmax = max(r, max(g, b));
    double cmin = min(r, min(g, b));
    double diff = cmax - cmin;
    double h = -1, s = -1;

    if(cmax == cmin) h = 0;
    else if(cmax == r) h = (60 * ((g - b) / diff) + 360) % 360;
    else if(cmax == g) h = (60 * ((b - r) / diff) + 120) % 360;
    else if(cmax == b) h = (60 * ((r - g) / diff) + 240) % 360;

    if(cmax == 0) s = 0;
    else s = (diff / cmax) * 100;

    double v = cmax * 100;
    return [h, s, v];
  }

  static double differenceRGB(Color a, Color b) {
    List<double> hsvA = rgbToHSV([a.red, a.green, a.blue]);
    List<double> hsvB = rgbToHSV([b.red, b.green, b.blue]);

    // debug('hsvA: $hsvA, hsvB: $hsvB');

    double hueDiff = (hsvB[0] - hsvA[0]).abs();
    double saturationDiff = (hsvB[1] - hsvA[1]).abs();
    double valueDiff = (hsvB[2] - hsvA[2]).abs();

    double diff = (hueDiff + saturationDiff + valueDiff) / 300;

    return diff;
  }

  static Color randomUnique(List<Color> existing) {
    if(existing.isEmpty) return _randomColor.randomColor();

    double threshold = 0.3;
    Color color = _randomColor.randomColor(colorBrightness: ColorBrightness.light, colorSaturation: ColorSaturation.highSaturation);
    int tries = 0;
    double bestScore = 0;
    Color bestColor = color;
    bool foundUnique = _uniqueScore(color, existing) > threshold;

    while(!foundUnique && tries < 10) {
      color = _randomColor.randomColor(colorBrightness: ColorBrightness.light);
      double score = _uniqueScore(color, existing);

      if(score > threshold) {
        bestColor = color;
        break;
      }

      if(score > bestScore) {
        bestScore = score;
        bestColor = color;
      }
      
      tries++;
    }

    if(tries == 10) debug('Tried 10 times, settled for best color yet.');

    return bestColor;
  }

  static double _uniqueScore(Color color, List<Color> existing) {
    List<double> scores = existing.map((c) => differenceRGB(color, c)).toList();
    return scores.reduce(min);
  }

  static Rx<Color> random() {
    return _randomColor.randomColor(colorBrightness: ColorBrightness.light, colorSaturation: ColorSaturation.highSaturation).obs;
  }

}