import 'package:flutter/material.dart';
import 'package:food_store/common/product/cart/cart_action_buttons.dart';
import 'package:food_store/common/widgets/containers/rounded_container.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:food_store/utils/constants/sizes.dart';

class PreviouslyOrderedCard extends StatelessWidget {
  const PreviouslyOrderedCard({
    super.key,
    required this.foodName,
    required this.canteenName,
    required this.price,
  });

  final String foodName;
  final String canteenName;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.sm),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RoundedContainer(
                radius: 10,
                width: 100,
                height: 100,
                child: Center(
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(AppImages.vegFriedMaggi),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(foodName,
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: AppSizes.sm),
                    Text(canteenName,
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: AppSizes.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rs. ${price.toString()}',
                            style: Theme.of(context).textTheme.headlineSmall),
                        const CartActionButtons(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
