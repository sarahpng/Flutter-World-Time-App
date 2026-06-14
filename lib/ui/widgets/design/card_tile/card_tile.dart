import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:world_time/configs/configs.dart';

class CardTile extends StatelessWidget {
  final String title;
  final Widget? suffix;
  final bool isSelected;
  final bool hasRadio;
  final bool isTrailing;
  const CardTile({
    super.key,
    required this.title,
    this.suffix,
    this.isSelected = false,
    this.hasRadio = false,
    this.isTrailing = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.a.t20,
      decoration: AppProps.boxdecoration.copyWith(
        border: Border.all(
          color: isSelected ? AppTheme.c.primary : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          if (!isTrailing) suffix ?? const SizedBox.shrink(),
          hasRadio
              ? isSelected
                    ? const Icon(LucideIcons.circle)
                    : const Icon(LucideIcons.circleCheck)
              : const SizedBox.shrink(),
          Space.x.t12,
          Expanded(child: Text(title, style: AppText.b1 + AppTheme.c.subText)),
          if (isTrailing) suffix ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
