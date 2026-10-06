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

  /// File path: assets/images/Birthday-1.png
  AssetGenImage get birthday1 =>
      const AssetGenImage('assets/images/Birthday-1.png');

  /// File path: assets/images/Birthday.png
  AssetGenImage get birthday =>
      const AssetGenImage('assets/images/Birthday.png');

  /// File path: assets/images/Book Club-1.png
  AssetGenImage get bookClub1 =>
      const AssetGenImage('assets/images/Book Club-1.png');

  /// File path: assets/images/Book Club.png
  AssetGenImage get bookClub =>
      const AssetGenImage('assets/images/Book Club.png');

  /// File path: assets/images/Exhibition-1.png
  AssetGenImage get exhibition1 =>
      const AssetGenImage('assets/images/Exhibition-1.png');

  /// File path: assets/images/Exhibition.png
  AssetGenImage get exhibition =>
      const AssetGenImage('assets/images/Exhibition.png');

  /// File path: assets/images/Meeting-1.png
  AssetGenImage get meeting1 =>
      const AssetGenImage('assets/images/Meeting-1.png');

  /// File path: assets/images/Meeting.png
  AssetGenImage get meeting => const AssetGenImage('assets/images/Meeting.png');

  /// File path: assets/images/Sport-1.png
  AssetGenImage get sport1 => const AssetGenImage('assets/images/Sport-1.png');

  /// File path: assets/images/Sport.png
  AssetGenImage get sport => const AssetGenImage('assets/images/Sport.png');

  /// File path: assets/images/all.svg
  String get all => 'assets/images/all.svg';

  /// File path: assets/images/calendar-add.svg
  String get calendarAdd => 'assets/images/calendar-add.svg';

  /// File path: assets/images/clock.svg
  String get clock => 'assets/images/clock.svg';

  /// File path: assets/images/evently.png
  AssetGenImage get evently => const AssetGenImage('assets/images/evently.png');

  /// File path: assets/images/forget-password-dark.png
  AssetGenImage get forgetPasswordDark =>
      const AssetGenImage('assets/images/forget-password-dark.png');

  /// File path: assets/images/forget-password-light.png
  AssetGenImage get forgetPasswordLight =>
      const AssetGenImage('assets/images/forget-password-light.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/home_dark.svg
  String get homeDark => 'assets/images/home_dark.svg';

  /// File path: assets/images/home_light.svg
  String get homeLight => 'assets/images/home_light.svg';

  /// File path: assets/images/lock.svg
  String get lock => 'assets/images/lock.svg';

  /// File path: assets/images/moon.svg
  String get moon => 'assets/images/moon.svg';

  /// File path: assets/images/route_logo.png
  AssetGenImage get routeLogo =>
      const AssetGenImage('assets/images/route_logo.png');

  /// File path: assets/images/route_profile.png
  AssetGenImage get routeProfile =>
      const AssetGenImage('assets/images/route_profile.png');

  /// File path: assets/images/sms.svg
  String get sms => 'assets/images/sms.svg';

  /// File path: assets/images/sun.svg
  String get sun => 'assets/images/sun.svg';

  /// File path: assets/images/user.svg
  String get user => 'assets/images/user.svg';

  /// File path: assets/images/user_dark.svg
  String get userDark => 'assets/images/user_dark.svg';

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
    birthday1,
    birthday,
    bookClub1,
    bookClub,
    exhibition1,
    exhibition,
    meeting1,
    meeting,
    sport1,
    sport,
    all,
    calendarAdd,
    clock,
    evently,
    forgetPasswordDark,
    forgetPasswordLight,
    google,
    homeDark,
    homeLight,
    lock,
    moon,
    routeLogo,
    routeProfile,
    sms,
    sun,
    user,
    userDark,
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
