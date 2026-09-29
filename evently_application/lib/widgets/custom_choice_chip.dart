import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/enum/categories_enum.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.isSelected,
    this.categoriesEnum,
    this.onSelected,
  });
  final bool isSelected;
  final CategoriesEnum? categoriesEnum;
  bool get isAll => categoriesEnum == null;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      onSelected: onSelected,
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
            isAll ? 'All' : categoriesEnum!.title,
            style: AppTextStyles.styleW600s16(
              color: isSelected ? AppColors.lightColor : AppColors.secColor,
            ),
          ),
        ],
      ),
    );
  }
}
