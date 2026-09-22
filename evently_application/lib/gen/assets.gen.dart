// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/1st_intro.png
  AssetGenImage get a1stIntro =>
      const AssetGenImage('assets/images/1st_intro.png');

  /// File path: assets/images/1st_intro_white.png
  AssetGenImage get a1stIntroWhite =>
      const AssetGenImage('assets/images/1st_intro_white.png');

  /// File path: assets/images/2nd_intro.png
  AssetGenImage get a2ndIntro =>
      const AssetGenImage('assets/images/2nd_intro.png');

  /// File path: assets/images/2nd_intro_white.png
  AssetGenImage get a2ndIntroWhite =>
      const AssetGenImage('assets/images/2nd_intro_white.png');

  /// File path: assets/images/3rd_intro.png
  AssetGenImage get a3rdIntro =>
      const AssetGenImage('assets/images/3rd_intro.png');

  /// File path: assets/images/3rd_intro_white.png
  AssetGenImage get a3rdIntroWhite =>
      const AssetGenImage('assets/images/3rd_intro_white.png');

  /// File path: assets/images/4th_intro.png
  AssetGenImage get a4thIntro =>
      const AssetGenImage('assets/images/4th_intro.png');

  /// File path: assets/images/4th_intro_white.png
  AssetGenImage get a4thIntroWhite =>
      const AssetGenImage('assets/images/4th_intro_white.png');

  /// File path: assets/images/evently.png
  AssetGenImage get evently => const AssetGenImage('assets/images/evently.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/lock.svg
  String get lock => 'assets/images/lock.svg';

  /// File path: assets/images/moon.svg
  String get moon => 'assets/images/moon.svg';

  /// File path: assets/images/route_logo.png
  AssetGenImage get routeLogo =>
      const AssetGenImage('assets/images/route_logo.png');

  /// File path: assets/images/sms.svg
  String get sms => 'assets/images/sms.svg';

  /// File path: assets/images/sun.svg
  String get sun => 'assets/images/sun.svg';

  /// File path: assets/images/user.svg
  String get user => 'assets/images/user.svg';

  /// List of all assets
  List<dynamic> get values => [
    a1stIntro,
    a1stIntroWhite,
    a2ndIntro,
    a2ndIntroWhite,
    a3rdIntro,
    a3rdIntroWhite,
    a4thIntro,
    a4thIntroWhite,
    evently,
    google,
    lock,
    moon,
    routeLogo,
    sms,
    sun,
    user,
  ];
}

abstract final class Assets {
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
