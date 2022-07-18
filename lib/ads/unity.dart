import 'package:flutter/foundation.dart';

class AdManagerUnity {
  static String get gameId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return '4638307';
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return '4638306';
    }
    return '';
  }

  static String get bannerAdPlacementId {
    return 'Banner_Android';
  }

  static String get interstitialVideoAdPlacementId {
    return 'Interstitial_Android';
  }

  static String get rewardedVideoAdPlacementId {
    return 'Rewarded_Android';
  }
}