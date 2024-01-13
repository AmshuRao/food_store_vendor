import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartActionButtons extends StatelessWidget {
  const CartActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ItemController controller = ItemController();
    return Row(children: [
      GestureDetector(
        onTap: () => controller.decrement(),
        child: RoundedContainer(
          border: Border.all(color: AppColors.grey),
          radius: 4,
          backgroundColor: Colors.transparent,
          child: const Icon(
            Iconsax.minus,
          ),
        ),
      ),
      Obx(
        () => RoundedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 25,
          radius: 4,
          backgroundColor: Colors.transparent,
          child: Center(
              child: Text(
            controller.count.value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
      ),
      GestureDetector(
        onTap: () => controller.count.value += 1,
        child: RoundedContainer(
          border: Border.all(color: AppColors.primary),
          radius: 4,
          backgroundColor: AppColors.primary,
          child: const Icon(
            Iconsax.add,
          ),
        ),
      ),
    ]);
  }
}

class ItemController extends GetxController {
  final RxInt count = 0.obs;

  void decrement() {
    if (count.value == 0) {
      return;
    } else {
      count.value -= 1;
    }
  }
}
