import 'package:flutter/material.dart';
import 'package:kkumul/shared/widgets/theme/theme.dart';

/// Navigation bar item enum
enum NavBarItem { home, group, my }

/// Bottom navigation bar widget (navibar_ios)
/// States: home, group, my
/// Size: width 375, height 80
/// Background white with shadow
/// Active color: #0FD380, Inactive: #C1C1C1
class AppBottomNavigationBar extends StatelessWidget {
  final NavBarItem currentItem;
  final ValueChanged<NavBarItem> onItemSelected;

  const AppBottomNavigationBar({
    required this.currentItem,
    required this.onItemSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
              label: '홈',
              isActive: currentItem == NavBarItem.home,
              onTap: () => onItemSelected(NavBarItem.home),
            ),
            _NavItem(
              icon: Icons.group_outlined,
              activeIcon: Icons.group,
              label: '모임',
              isActive: currentItem == NavBarItem.group,
              onTap: () => onItemSelected(NavBarItem.group),
            ),
            _NavItem(
              icon: Icons.person_outline,
              activeIcon: Icons.person,
              label: '마이',
              isActive: currentItem == NavBarItem.my,
              onTap: () => onItemSelected(NavBarItem.my),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.navActive : AppColors.navInactive;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.navLabel.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
