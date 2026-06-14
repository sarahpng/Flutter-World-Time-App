import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:world_time/configs/configs.dart';
import 'package:world_time/provider/navigation.dart';
import 'package:world_time/router/routes.dart';
import 'package:world_time/ui/widgets/headless/app_touch.dart';

part '_data.dart';
part '_model.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      padding: Space.z.t(16),
      decoration: BoxDecoration(
        color: AppTheme.c.cardBase,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: _tabs(context).map((tab) {
            final isActive =
                tab.index == AppNavigation.s(context, true).currentIndex;

            return Expanded(
              child: AppTouch(
                onTap: () {
                  if (isActive) return;
                  AppNavigation.s(context).updateIndex(tab.index);

                  // ''.trackUserAction('bottom_bar_tapped ${tab.path}');
                },
                child: AnimatedScale(
                  scale: isActive ? 1 : 0.89,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    margin: Space.sym(10, 0),
                    padding: Space.a.t08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: isActive
                          ? AppTheme.c.secondary
                          : Colors.transparent,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Space.y.t04,
                        ColorFiltered(
                          colorFilter: isActive
                              ? ColorFilter.mode(
                                  AppTheme.c.text,
                                  BlendMode.srcIn,
                                )
                              : ColorFilter.mode(
                                  AppTheme.c.subText,
                                  BlendMode.srcIn,
                                ),
                          child: isActive ? tab.activeIcon : tab.inActiveIcon,
                        ),
                        Space.y.t04,
                        Text(
                          tab.label,
                          style: AppText.b2.cl(
                            isActive ? AppTheme.c.text : AppTheme.c.subText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
