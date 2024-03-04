import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/custom%20shapes/curved_edges.dart';
import 'package:food_store/utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: Container(
        color: AppColors.primary,
        child: SizedBox(
          height: 280,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(400),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(400),
                  ),
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
