// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

class PlanViewerTheme {
  final BuildContext context;

  PlanViewerTheme(this.context);

  ThemeData get lightTheme {
    final baseTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: PlanViewerColors._light.brand,
        error: PlanViewerColors._light.error,
        onSurface: PlanViewerColors._light.brandBlack,
        surface: Colors.white,
      ),
      useMaterial3: true,
      extensions: const [
        PlanViewerColors._light,
      ],
    );
    final baseButtonStyle = ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      textStyle: WidgetStatePropertyAll(baseTheme.normal16Medium),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: baseTheme.normal16Medium.copyWith(
          color: baseTheme.colorScheme.onSurface,
        ),
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: Colors.transparent,
      ),
      iconTheme: IconThemeData(
        color: context.theme.colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: context.theme.planViewerColors.bg,
      filledButtonTheme: FilledButtonThemeData(
        style: baseButtonStyle.copyWith(
          backgroundColor: _filledButtonBackgroundColor(baseTheme),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: baseButtonStyle.copyWith(
          foregroundColor: _outlinedButtonForegroundColor(baseTheme),
          side: _outlinedButtonBorder(baseTheme),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: baseButtonStyle.copyWith(
          backgroundColor: _textButtonBackgroundColor(baseTheme),
          foregroundColor: _textButtonForegroundColor(baseTheme),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: baseTheme.planViewerColors.brand,
      ),
    );
  }


  WidgetStateColor _filledButtonBackgroundColor(ThemeData theme) {
    return WidgetStateColor.resolveWith((states) {
      final color = theme.planViewerColors.brand;

      if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
        return color.withOpacity(0.8);
      }

      if (states.contains(WidgetState.disabled)) {
        return color.withOpacity(0.5);
      }

      return color;
    });
  }

  WidgetStateColor _outlinedButtonForegroundColor(ThemeData theme) {
    return WidgetStateColor.resolveWith((states) {
      return _resolveOutlinedButtonColor(theme, states);
    });
  }

  WidgetStateBorderSide _outlinedButtonBorder(ThemeData theme) {
    return WidgetStateBorderSide.resolveWith((states) {
      final color = _resolveOutlinedButtonColor(theme, states);
      return BorderSide(
        color: color,
        width: 1.5,
      );
    });
  }

  Color _resolveOutlinedButtonColor(ThemeData theme, Set<WidgetState> states) {
    final color = theme.planViewerColors.brand;

    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
      return color.withOpacity(0.8);
    }

    if (states.contains(WidgetState.disabled)) {
      return color.withOpacity(0.5);
    }

    return color;
  }

  WidgetStateColor _textButtonBackgroundColor(ThemeData theme) {
    return WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
        return Colors.black.withOpacity(0.8);
      }

      if (states.contains(WidgetState.disabled)) {
        return theme.planViewerColors.brand.withOpacity(0.5);
      }

      return Colors.grey;
    });
  }

  WidgetStateColor _textButtonForegroundColor(ThemeData theme) {
    return WidgetStateColor.resolveWith((states) {
      final color = theme.planViewerColors.brand;

      if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
        return color.withOpacity(0.8);
      }

      if (states.contains(WidgetState.disabled)) {
        return Colors.white;
      }

      return color;
    });
  }
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension PlanViewerColorsGetter on ThemeData {
  PlanViewerColors get planViewerColors => extension<PlanViewerColors>() ?? PlanViewerColors._light;
}

extension PhoenixTypographyExtension on ThemeData {
  // Figma "Line height" to TextStyle.height conversion
  // Line height / Font Size = height
  // for normal16Medium: 22 / 16 = 1.375

  TextStyle get large40Semibold => GoogleFonts.inter(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        height: 56 / 40,
      );

  TextStyle get large30Semibold => GoogleFonts.inter(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        height: 36 / 30,
      );

  TextStyle get large28Bold => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: colorScheme.onSurface,
        height: 32 / 28,
      );

  TextStyle get large24Semibold => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        height: 30 / 24,
      );

  TextStyle get title20Medium => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
        height: 26 / 20,
      );

  TextStyle get title20Semibold => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        height: 26 / 20,
      );

  TextStyle get title18Semibold => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        height: 24 / 18,
      );

  TextStyle get normal16Medium => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
        height: 22 / 16,
      );

  TextStyle get normal16Regular => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
        height: 22 / 16,
      );

  TextStyle get small14Semibold => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        height: 18 / 14,
      );

  TextStyle get small14Regular => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: colorScheme.onSurface,
        height: 18 / 14,
      );

  TextStyle get verySmall12Semibold => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: colorScheme.onSurface,
        height: 12 / 16,
      );

  TextStyle get verySmall12Medium => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
        height: 12 / 16,
      );

  TextStyle get verySmall12Regular => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        height: 12 / 16,
      );
}

class PlanViewerColors extends ThemeExtension<PlanViewerColors> {
  static const _light = PlanViewerColors(
    brand: Color(0xFF0073CC),
    bg: Color(0xFF1E5A8E),
    error: Color.fromARGB(255, 221, 17, 17),
    brandBlack: Color.fromARGB(255, 23, 24, 25),
    brandLight: Color(0xFFDCEFFE),
  );

  final Color brand;
  final Color bg;
  final Color error;
  final Color brandBlack;
  final Color brandLight;

  const PlanViewerColors({
    required this.brand,
    required this.bg,
    required this.error,
    required this.brandBlack,
    required this.brandLight,
  });

  @override
  ThemeExtension<PlanViewerColors> copyWith({
    Color? brand,
    Color? bg,
    Color? error,
    Color? brandBlack,
    Color? brandLight,
  }) {
    return PlanViewerColors(
      brand: brand ?? this.brand,
      bg: bg ?? this.bg,
      error: error ?? this.error,
      brandBlack: brandBlack ?? this.brandBlack,
      brandLight: brandLight ?? this.brandLight,
    );
  }

  @override
  ThemeExtension<PlanViewerColors> lerp(covariant ThemeExtension<PlanViewerColors>? other, double t) {
    if (other is! PlanViewerColors) {
      return this;
    }

    return PlanViewerColors(
      brand: Color.lerp(brand, other.brand, t)!,
      bg: Color.lerp(bg, other.bg, t)!,
      error: Color.lerp(error, other.error, t)!,
      brandBlack: Color.lerp(brandBlack, other.brandBlack, t)!,
      brandLight: Color.lerp(brandLight, other.brandLight, t)!,
    );
  }
}

typedef MaterialPropertyResolverWithTheme<T> = WidgetStateProperty<T> Function(
  ThemeData theme,
  WidgetPropertyResolver<T> callback,
);
