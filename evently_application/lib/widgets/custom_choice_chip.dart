import 'package:evently_application/l10n/app_localizations.dart';
import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/enum/categories_enum.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/provider/new_event_provider.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    this.isSelected,
    this.categoriesEnum,
    this.onSelected,
  });
  // when isSelected / onSelected are not passed, the chip uses NewEventProvider
  final bool? isSelected;
  final CategoriesEnum? categoriesEnum;
  bool get isAll => categoriesEnum == null;
  final ValueChanged<bool>? onSelected;
  @override
  Widget build(BuildContext context) {
    final bool isSelected =
        this.isSelected ??
        Provider.of<NewEventProvider>(context, listen: true).selectedCategory ==
            categoriesEnum;
    return ChoiceChip(
      onSelected:
          onSelected ??
          (selected) {
            if (isAll) return;
            Provider.of<NewEventProvider>(
              context,
              listen: false,
            ).setSelectedCategory(categoriesEnum!);
          },
      selected: isSelected,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          isAll
              ? SvgPicture.asset(
                  Assets.images.all,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    isSelected ? AppColors.lightColor : AppColors.secColor,
                    BlendMode.srcIn,
                  ),
                )
              : Icon(
                  categoriesEnum!.getIcon,
                  color: isSelected ? AppColors.lightColor : AppColors.secColor,
                ),
          Text(
            isAll
                ? AppLocalizations.of(context)!.all
                : categoriesEnum!.getTitle(context),
            style: AppTextStyles.styleW600s16(
              color: isSelected ? AppColors.lightColor : AppColors.secColor,
            ),
          ),
        ],
      ),
    );
  }
}
