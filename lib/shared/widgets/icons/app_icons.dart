import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';

/// App icon collection
///
/// Provides consistent icon widgets with customizable color and size.
/// Default color is [AppColors.gray2] and default size is 24.
class AppIcons {
  AppIcons._();

  /// Home icon (24x24)
  static Widget home({Color? color, double size = 24}) {
    return Icon(
      Icons.home_outlined,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Group icon (24x24)
  static Widget group({Color? color, double size = 24}) {
    return Icon(
      Icons.people_outline,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// My/Profile icon (24x24)
  static Widget my({Color? color, double size = 24}) {
    return Icon(
      Icons.person_outline,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Back arrow icon (24x24)
  static Widget back({Color? color, double size = 24}) {
    return Icon(
      Icons.arrow_back_ios_new,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Right arrow icon (24x24)
  static Widget right({Color? color, double size = 24}) {
    return Icon(
      Icons.arrow_forward_ios,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Checkmark in circle icon (24x24)
  static Widget check({Color? color, double size = 24}) {
    return Icon(
      Icons.check_circle_outline,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Search/Magnifier icon (24x24)
  static Widget search({Color? color, double size = 24}) {
    return Icon(
      Icons.search,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Plus icon (24x24)
  static Widget plus({Color? color, double size = 24}) {
    return Icon(
      Icons.add,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Plus icon - dark variant (24x24)
  static Widget plusDark({double size = 24}) {
    return Icon(
      Icons.add,
      color: AppColors.gray6,
      size: size,
    );
  }

  /// Delete/X icon (24x24)
  static Widget delete({Color? color, double size = 24}) {
    return Icon(
      Icons.close,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Location pin icon - filled (24x24)
  static Widget pinFill({Color? color, double size = 24}) {
    return Icon(
      Icons.location_on,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Calendar/Date icon - filled (24x24)
  static Widget dateFill({Color? color, double size = 24}) {
    return Icon(
      Icons.calendar_today,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Clock/Time icon - filled (24x24)
  static Widget timeFill({Color? color, double size = 24}) {
    return Icon(
      Icons.access_time_filled,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Camera icon (42x42)
  static Widget camera({Color? color, double size = 42}) {
    return Icon(
      Icons.camera_alt_outlined,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }

  /// Penalty icon - filled (24x24)
  static Widget penaltyFill({Color? color, double size = 24}) {
    return Icon(
      Icons.warning_amber_rounded,
      color: color ?? AppColors.gray2,
      size: size,
    );
  }
}

/// Individual icon widget for Home
class IcHome extends StatelessWidget {
  final Color? color;
  final double size;

  const IcHome({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.home(color: color, size: size);
  }
}

/// Individual icon widget for Group
class IcGroup extends StatelessWidget {
  final Color? color;
  final double size;

  const IcGroup({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.group(color: color, size: size);
  }
}

/// Individual icon widget for My/Profile
class IcMy extends StatelessWidget {
  final Color? color;
  final double size;

  const IcMy({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.my(color: color, size: size);
  }
}

/// Individual icon widget for Back arrow
class IcBack extends StatelessWidget {
  final Color? color;
  final double size;

  const IcBack({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.back(color: color, size: size);
  }
}

/// Individual icon widget for Right arrow
class IcRight extends StatelessWidget {
  final Color? color;
  final double size;

  const IcRight({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.right(color: color, size: size);
  }
}

/// Individual icon widget for Check
class IcCheck extends StatelessWidget {
  final Color? color;
  final double size;

  const IcCheck({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.check(color: color, size: size);
  }
}

/// Individual icon widget for Search
class IcSearch extends StatelessWidget {
  final Color? color;
  final double size;

  const IcSearch({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.search(color: color, size: size);
  }
}

/// Individual icon widget for Plus
class IcPlus extends StatelessWidget {
  final Color? color;
  final double size;

  const IcPlus({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.plus(color: color, size: size);
  }
}

/// Individual icon widget for Plus (dark variant)
class IcPlusDark extends StatelessWidget {
  final double size;

  const IcPlusDark({
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.plusDark(size: size);
  }
}

/// Individual icon widget for Delete
class IcDelete extends StatelessWidget {
  final Color? color;
  final double size;

  const IcDelete({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.delete(color: color, size: size);
  }
}

/// Individual icon widget for Pin (filled)
class IcPinFill extends StatelessWidget {
  final Color? color;
  final double size;

  const IcPinFill({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.pinFill(color: color, size: size);
  }
}

/// Individual icon widget for Date (filled)
class IcDateFill extends StatelessWidget {
  final Color? color;
  final double size;

  const IcDateFill({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.dateFill(color: color, size: size);
  }
}

/// Individual icon widget for Time (filled)
class IcTimeFill extends StatelessWidget {
  final Color? color;
  final double size;

  const IcTimeFill({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.timeFill(color: color, size: size);
  }
}

/// Individual icon widget for Camera
class IcCamera extends StatelessWidget {
  final Color? color;
  final double size;

  const IcCamera({
    this.color,
    this.size = 42,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.camera(color: color, size: size);
  }
}

/// Individual icon widget for Penalty (filled)
class IcPenaltyFill extends StatelessWidget {
  final Color? color;
  final double size;

  const IcPenaltyFill({
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcons.penaltyFill(color: color, size: size);
  }
}
