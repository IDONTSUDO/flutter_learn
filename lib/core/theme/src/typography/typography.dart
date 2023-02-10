import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learn/core/core.dart';

import 'font_size.dart';

class Typography {
  static final TextStyle _systemFont = Platform.isAndroid
      ? const TextStyle(fontFamily: 'Roboto')
      : const TextStyle(fontFamily: '.SF Pro Display');

  TextStyle caption3({
    FontColor? color,
    FontWeight? fontWeight,
    FontName fontName = FontName.caption3,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle caption2({
    FontColor? color,
    FontWeight? fontWeight,
    FontName fontName = FontName.caption2,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle caption1({
    FontColor? color,
    FontWeight? fontWeight,
    FontName fontName = FontName.caption1,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle footnote({
    FontColor? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontName fontName = FontName.footnote,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        decoration: decoration,
        fontWeight: fontWeight,
      );

  TextStyle body2({
    FontColor? color,
    FontWeight? fontWeight,
    FontName fontName = FontName.body2,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle body1({
    FontColor? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontName fontName = FontName.body1,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        decoration: decoration,
        fontWeight: fontWeight,
      );

  TextStyle headline({
    FontColor? color,
    FontWeight? fontWeight,
    FontName fontName = FontName.headline,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle title4({
    FontColor? color,
    FontWeight? fontWeight,
    FontName fontName = FontName.title4,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle title3({
    FontColor? color,
    FontWeight? fontWeight,
    FontName fontName = FontName.title3,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle title2({
    FontColor? color,
    FontName fontName = FontName.title2,
    FontWeight? fontWeight = FontWeight.w500,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle title1({
    FontColor? color,
    FontWeight? fontWeight,
    FontName fontName = FontName.title1,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle largeTitle({
    FontColor? color,
    FontWeight? fontWeight,
    FontName fontName = FontName.largeTitle,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle headerLarge({
    FontColor? color,
    FontName fontName = FontName.headerLarge,
    FontWeight? fontWeight = FontWeight.w900,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle headerSmall({
    FontColor? color,
    FontName fontName = FontName.largeTitle,
    FontWeight? fontWeight = FontWeight.w700,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle labelLarge({
    FontColor? color,
    FontName fontName = FontName.largeTitle,
    FontWeight? fontWeight = FontWeight.w600,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle labelSmall({
    FontColor? color,
    FontWeight? fontWeight,
    FontName fontName = FontName.largeTitle,
    FontEmphasis emphasis = FontEmphasis.regular,
  }) =>
      _buildFont(
        fontColor: color,
        fontName: fontName,
        emphasis: emphasis,
        fontWeight: fontWeight,
      );

  TextStyle _buildFont({
    FontColor? fontColor,
    FontName? fontName,
    FontWeight? fontWeight,
    FontEmphasis? emphasis,
    TextDecoration? decoration,
  }) =>
      _systemFont.copyWith(
        fontWeight: fontWeight ??
            (emphasis == FontEmphasis.bold ? FontWeight.w700 : _systemFont.fontWeight),
        color: fontColor == null
            ? ThemeProvider.palette.pickFontColor(FontColor.primary)
            : fontColor.color,
        fontSize: fontName == null ? FontName.body1.size : fontName.size,
        decoration: decoration,
      );
}

enum FontEmphasis {
  regular,
  bold,
  italic,
  strikethrough,
}
