part of 'bottom_bar.dart';

List<_BottomBar> _tabs(BuildContext context) {
  return [
    _BottomBar(
      label: 'Home',
      inActiveIcon: const Icon(LucideIcons.clock),
      activeIcon: const Icon(LucideIcons.clock),
      path: AppRoutes.home,
      index: 0,
    ),
    _BottomBar(
      label: 'Discover',
      inActiveIcon: const Icon(LucideIcons.compass),
      activeIcon: const Icon(LucideIcons.compass),
      path: AppRoutes.discover,
      index: 1,
    ),
    _BottomBar(
      label: 'Convertor',
      inActiveIcon: const Icon(LucideIcons.arrowLeftRight),
      activeIcon: const Icon(LucideIcons.arrowLeftRight),
      path: AppRoutes.timeConvertor,
      index: 2,
    ),
  ];
}
