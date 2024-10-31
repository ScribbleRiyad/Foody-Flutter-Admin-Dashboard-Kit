import 'package:foody/controller/ui/loaders_controller.dart';
import 'package:foody/helpers/theme/app_themes.dart';
import 'package:foody/helpers/utils/my_shadow.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_card.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadersScreen extends StatefulWidget {
  const LoadersScreen({super.key});

  @override
  State<LoadersScreen> createState() => _LoadersScreenState();
}

class _LoadersScreenState extends State<LoadersScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late LoadersController controller;

  @override
  void initState() {
    controller = LoadersController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'loaders_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Loader",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Widget'),
                        MyBreadcrumbItem(name: 'Loader', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(sizes: 'lg-3 md-6', child: simpleLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: waveDotsLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: inkDropLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: twistingDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: threeRotatingDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: staggeredDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: fourRotatingDotsLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: fallingDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: progressiveDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: discreteCircularLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: threeArchedCircleLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: bouncingBallLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: flickrLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: hexagonDotsLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: beatLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: twoRotatingArcLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: newtonCradleLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: stretchedDotsLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: halfTriangleDotLoader()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: dotsTriangleLoader()),
                    MyFlexItem(
                        sizes: 'lg-3 md-6', child: horizontalRotatingLoader()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget horizontalRotatingLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Horizontal Rotating Loader", fontWeight: 600),
          LoadingAnimationWidget.horizontalRotatingDots(
              size: 40, color: contentTheme.primary),
        ],
      ),
    );
  }

  Widget flickrLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Flickr Loader", fontWeight: 600),
          LoadingAnimationWidget.flickr(
              size: 40,
              leftDotColor: contentTheme.secondary,
              rightDotColor: contentTheme.primary),
        ],
      ),
    );
  }

  Widget dotsTriangleLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("DotsTriangle Loader", fontWeight: 600),
          LoadingAnimationWidget.dotsTriangle(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget halfTriangleDotLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Half TriangleDot Loader", fontWeight: 600),
          LoadingAnimationWidget.halfTriangleDot(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget stretchedDotsLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("StretchedDots Loader", fontWeight: 600),
          LoadingAnimationWidget.stretchedDots(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget newtonCradleLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("NewtonCradle Loader", fontWeight: 600),
          LoadingAnimationWidget.newtonCradle(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget twoRotatingArcLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Two RotatingArc Loader", fontWeight: 600),
          LoadingAnimationWidget.twoRotatingArc(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget beatLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Beat Loader", fontWeight: 600),
          LoadingAnimationWidget.beat(color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget hexagonDotsLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Hexagon Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.hexagonDots(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget bouncingBallLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Bouncing Ball Loader", fontWeight: 600),
          LoadingAnimationWidget.bouncingBall(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget threeArchedCircleLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Three Arched Circle Loader", fontWeight: 600),
          LoadingAnimationWidget.threeArchedCircle(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget discreteCircularLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Discrete Circular Loader", fontWeight: 600),
          LoadingAnimationWidget.discreteCircle(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget progressiveDotsLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Progressive Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.prograssiveDots(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget fallingDotsLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Falling Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.fallingDot(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget fourRotatingDotsLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Four Rotating Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.fourRotatingDots(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget staggeredDotsLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("staggered Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.staggeredDotsWave(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget threeRotatingDotsLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("ThreeRotating Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.threeRotatingDots(
              color: contentTheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget twistingDotsLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Twisting Dots Loader", fontWeight: 600),
          LoadingAnimationWidget.twistingDots(
              rightDotColor: contentTheme.primary,
              leftDotColor: contentTheme.secondary,
              size: 40),
        ],
      ),
    );
  }

  Widget simpleLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Simple Loader", fontWeight: 600),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget waveDotsLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("WaveDots Loader", fontWeight: 600),
          LoadingAnimationWidget.waveDots(
              color: theme.colorScheme.primary, size: 40),
        ],
      ),
    );
  }

  Widget inkDropLoader() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Ink Drop Loader", fontWeight: 600),
          LoadingAnimationWidget.inkDrop(
              color: theme.colorScheme.primary, size: 40),
        ],
      ),
    );
  }
}
