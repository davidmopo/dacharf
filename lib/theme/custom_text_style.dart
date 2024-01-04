import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack90002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90002.withOpacity(0.28),
      );
  static get bodyLargeLancelot => theme.textTheme.bodyLarge!.lancelot;
  static get bodyLargeLeagueGothic => theme.textTheme.bodyLarge!.leagueGothic;
  static get bodyMedium14 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMedium15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
      );
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyMediumLaoSansPro =>
      theme.textTheme.bodyMedium!.laoSansPro.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumLedgerPrimaryContainer =>
      theme.textTheme.bodyMedium!.ledger.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 15.fSize,
      );
  static get bodyMediumLemonadaPrimary =>
      theme.textTheme.bodyMedium!.lemonada.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 14.fSize,
      );
  static get bodyMediumLight => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumLight_1 => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumOnError => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onError,
        fontSize: 14.fSize,
      );
  static get bodyMediumPolyOnError => theme.textTheme.bodyMedium!.poly.copyWith(
        color: theme.colorScheme.onError,
        fontSize: 15.fSize,
      );
  static get bodyMediumPoorRichard => theme.textTheme.bodyMedium!.poorRichard;
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 14.fSize,
      );
  static get bodySmallJetBrainsMonoBlack90002 =>
      theme.textTheme.bodySmall!.jetBrainsMono.copyWith(
        color: appTheme.black90002,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallKottaOneBlack90002 =>
      theme.textTheme.bodySmall!.kottaOne.copyWith(
        color: appTheme.black90002,
        fontSize: 10.fSize,
      );
  static get bodySmallLacquerBlack90002 =>
      theme.textTheme.bodySmall!.lacquer.copyWith(
        color: appTheme.black90002,
      );
  static get bodySmallLangarPrimaryContainer =>
      theme.textTheme.bodySmall!.langar.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get bodySmallLatoBlack90002 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.black90002.withOpacity(0.31),
        fontSize: 10.fSize,
      );
  static get bodySmallLatoBlack9000210 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.black90002,
        fontSize: 10.fSize,
      );
  static get bodySmallLatoBlack90002_1 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.black90002,
      );
  static get bodySmallLedgerPrimaryContainer =>
      theme.textTheme.bodySmall!.ledger.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 10.fSize,
      );
  static get bodySmallLemonadaPrimaryContainer =>
      theme.textTheme.bodySmall!.lemonada.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 12.fSize,
      );
  static get bodySmallLoraBlack90002 =>
      theme.textTheme.bodySmall!.lora.copyWith(
        color: appTheme.black90002,
      );
  static get bodySmallOoohBabyBlack90002 =>
      theme.textTheme.bodySmall!.ooohBaby.copyWith(
        color: appTheme.black90002,
        fontSize: 12.fSize,
      );
  static get bodySmallPolyBlack90002 =>
      theme.textTheme.bodySmall!.poly.copyWith(
        color: appTheme.black90002,
        fontSize: 10.fSize,
      );
  static get bodySmallRobotoBlack90002 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.black90002,
        fontSize: 10.fSize,
      );
  // Display text style
  static get displaySmallLeagueGothic =>
      theme.textTheme.displaySmall!.leagueGothic.copyWith(
        fontWeight: FontWeight.w400,
      );
  // Headline text style
  static get headlineLargeKreon =>
      theme.textTheme.headlineLarge!.kreon.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get headlineLargeLatoPrimary =>
      theme.textTheme.headlineLarge!.lato.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get headlineLargeLeagueGothicBlack90002 =>
      theme.textTheme.headlineLarge!.leagueGothic.copyWith(
        color: appTheme.black90002,
      );
  static get headlineLargeMalgunGothic =>
      theme.textTheme.headlineLarge!.malgunGothic.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallBold => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallKottaOnePrimaryContainer =>
      theme.textTheme.headlineSmall!.kottaOne.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get headlineSmallLato => theme.textTheme.headlineSmall!.lato;
  static get headlineSmallLatoExtraBold =>
      theme.textTheme.headlineSmall!.lato.copyWith(
        fontWeight: FontWeight.w800,
      );
  static get headlineSmallLeagueGothic =>
      theme.textTheme.headlineSmall!.leagueGothic;
  static get headlineSmallLeagueSpartan =>
      theme.textTheme.headlineSmall!.leagueSpartan.copyWith(
        fontWeight: FontWeight.w800,
      );
  static get headlineSmallLigconsolataPrimaryContainer =>
      theme.textTheme.headlineSmall!.ligconsolata.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get headlineSmallPoly => theme.textTheme.headlineSmall!.poly;
  static get headlineSmallRobotoPrimaryContainer =>
      theme.textTheme.headlineSmall!.roboto.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  // Label text style
  static get labelLargeGray400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray400,
      );
  static get labelLargeLatoBlack90002 =>
      theme.textTheme.labelLarge!.lato.copyWith(
        color: appTheme.black90002,
        fontSize: 13.fSize,
      );
  static get labelLargeLatoBlack9000213 =>
      theme.textTheme.labelLarge!.lato.copyWith(
        color: appTheme.black90002,
        fontSize: 13.fSize,
      );
  static get labelLargePoppinsPrimaryContainer =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get labelLargePrimaryContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get labelLargePrimaryContainer_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  // Title text style
  static get titleLargeKottaOneBlack90002 =>
      theme.textTheme.titleLarge!.kottaOne.copyWith(
        color: appTheme.black90002,
      );
  static get titleLargeKreonBlack90002 =>
      theme.textTheme.titleLarge!.kreon.copyWith(
        color: appTheme.black90002,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeLatoBlack90002 =>
      theme.textTheme.titleLarge!.lato.copyWith(
        color: appTheme.black90002,
      );
  static get titleLargeRobotoPrimary =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumPoppins =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        fontSize: 18.fSize,
      );
  static get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleSmallExtraBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w800,
      );
  static get titleSmallKreonPrimaryContainer =>
      theme.textTheme.titleSmall!.kreon.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimaryContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w800,
      );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get lacquer {
    return copyWith(
      fontFamily: 'Lacquer',
    );
  }

  TextStyle get ooohBaby {
    return copyWith(
      fontFamily: 'Oooh Baby',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get leagueSpartan {
    return copyWith(
      fontFamily: 'League Spartan',
    );
  }

  TextStyle get poorRichard {
    return copyWith(
      fontFamily: 'Poor Richard',
    );
  }

  TextStyle get lateef {
    return copyWith(
      fontFamily: 'Lateef',
    );
  }

  TextStyle get risque {
    return copyWith(
      fontFamily: 'Risque',
    );
  }

  TextStyle get kreon {
    return copyWith(
      fontFamily: 'Kreon',
    );
  }

  TextStyle get lancelot {
    return copyWith(
      fontFamily: 'Lancelot',
    );
  }

  TextStyle get lora {
    return copyWith(
      fontFamily: 'Lora',
    );
  }

  TextStyle get leagueGothic {
    return copyWith(
      fontFamily: 'League Gothic',
    );
  }

  TextStyle get langar {
    return copyWith(
      fontFamily: 'Langar',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get kottaOne {
    return copyWith(
      fontFamily: 'Kotta One',
    );
  }

  TextStyle get laoSansPro {
    return copyWith(
      fontFamily: 'Lao Sans Pro',
    );
  }

  TextStyle get malgunGothic {
    return copyWith(
      fontFamily: 'Malgun Gothic',
    );
  }

  TextStyle get ledger {
    return copyWith(
      fontFamily: 'Ledger',
    );
  }

  TextStyle get ligconsolata {
    return copyWith(
      fontFamily: 'Ligconsolata',
    );
  }

  TextStyle get lemonada {
    return copyWith(
      fontFamily: 'Lemonada',
    );
  }

  TextStyle get jetBrainsMono {
    return copyWith(
      fontFamily: 'JetBrains Mono',
    );
  }

  TextStyle get poly {
    return copyWith(
      fontFamily: 'Poly',
    );
  }
}
