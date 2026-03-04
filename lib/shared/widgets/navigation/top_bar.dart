import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';

/// Top bar widget (topbar_ios)
/// Size: width 375, height 52
/// Contains: back button (left), title (center), more button (right)
/// Title: Pretendard SemiBold 16px, #242424
/// Bottom line: #DFDFDF
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onMorePressed;
  final bool showBackButton;
  final bool showMoreButton;

  const AppTopBar({
    this.title,
    this.onBackPressed,
    this.onMorePressed,
    this.showBackButton = true,
    this.showMoreButton = false,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(52);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52 + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.gray2,
            width: 1,
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Back button (left)
          if (showBackButton)
            Positioned(
              left: 0,
              child: IconButton(
                onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.textPrimary,
                  size: 20,
                ),
                padding: const EdgeInsets.all(16),
              ),
            ),

          // Title (center)
          if (title != null)
            Text(
              title!,
              style: AppTextStyles.topBarTitle,
            ),

          // More button (right)
          if (showMoreButton)
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: onMorePressed,
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.textPrimary,
                  size: 20,
                ),
                padding: const EdgeInsets.all(16),
              ),
            ),
        ],
      ),
    );
  }
}
