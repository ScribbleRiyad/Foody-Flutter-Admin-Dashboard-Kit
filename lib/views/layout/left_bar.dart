import 'package:flutter/material.dart';
import 'package:foody/helpers/services/url_service.dart';
import 'package:foody/helpers/theme/app_themes.dart';
import 'package:foody/helpers/theme/theme_customizer.dart';
import 'package:foody/helpers/utils/my_shadow.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_card.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_router.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/images.dart';
import 'package:foody/widgets/custom_pop_menu.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

typedef LeftbarMenuFunction = void Function(String key);

class LeftbarObserver {
  static Map<String, LeftbarMenuFunction> observers = {};

  static attachListener(String key, LeftbarMenuFunction fn) {
    observers[key] = fn;
  }

  static detachListener(String key) {
    observers.remove(key);
  }

  static notifyAll(String key) {
    for (var fn in observers.values) {
      fn(key);
    }
  }
}

class LeftBar extends StatefulWidget {
  final bool isCondensed;

  const LeftBar({super.key, this.isCondensed = false});

  @override
  _LeftBarState createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar> with SingleTickerProviderStateMixin, UIMixin {
  final ThemeCustomizer customizer = ThemeCustomizer.instance;

  bool isCondensed = false;
  String path = UrlService.getCurrentUrl();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isCondensed = widget.isCondensed;
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(position: MyShadowPosition.centerRight, elevation: 0.2),
      child: AnimatedContainer(
        color: leftBarTheme.background,
        width: isCondensed ? 70 : 254,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 53,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed('/home');
                      },
                      child: Image.asset(
                        Images.logoIcon, height: widget.isCondensed ? 24 : 32,
                        // color: contentTheme.primary,
                      )),
                  if (!widget.isCondensed)
                    Flexible(
                      fit: FlexFit.loose,
                      child: MySpacing.width(16),
                    ),
                  if (!widget.isCondensed)
                    Flexible(
                      fit: FlexFit.loose,
                      child: MyText.labelLarge(
                        "Foody",
                        style: GoogleFonts.raleway(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: theme.colorScheme.primary,
                          letterSpacing: 1,
                        ),
                        maxLines: 1,
                      ),
                    )
                ],
              ),
            ),
            Divider(
              color: contentTheme.secondary.withAlpha(40),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySpacing.height(16),
                  LabelWidget(isCondensed: isCondensed, label: "Client App"),
                  NavigationItem(
                    iconData: LucideIcons.home,
                    title: "Home",
                    isCondensed: isCondensed,
                    route: '/home',
                  ),
                  NavigationItem(
                    iconData: LucideIcons.shoppingBag,
                    title: "Foods",
                    isCondensed: isCondensed,
                    route: '/foods',
                  ),
                  NavigationItem(
                    iconData: LucideIcons.shoppingCart,
                    title: "Cart",
                    isCondensed: isCondensed,
                    route: '/cart',
                  ),
                  NavigationItem(
                    iconData: LucideIcons.listOrdered,
                    title: "Order",
                    isCondensed: isCondensed,
                    route: '/orders',
                  ),
                  NavigationItem(
                    iconData: LucideIcons.messagesSquare,
                    title: "Chat",
                    isCondensed: isCondensed,
                    route: '/chat',
                  ),
                  LabelWidget(isCondensed: isCondensed, label: "Admin Panel"),
                  NavigationItem(
                    iconData: LucideIcons.layoutDashboard,
                    title: "Dashboard",
                    isCondensed: isCondensed,
                    route: '/dashboard',
                  ),
                  MenuWidget(
                    iconData: LucideIcons.store,
                    isCondensed: isCondensed,
                    title: "Orders",
                    children: [
                      MenuItem(
                        title: "List",
                        isCondensed: isCondensed,
                        route: '/admin/orders',
                        iconData: LucideIcons.scrollText,
                      ),
                      MenuItem(
                        title: "Detail",
                        isCondensed: isCondensed,
                        route: '/admin/orders/detail',
                        iconData: LucideIcons.listOrdered,
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.users,
                    isCondensed: isCondensed,
                    title: "Customer",
                    children: [
                      MenuItem(
                        title: "List",
                        isCondensed: isCondensed,
                        route: '/admin/customers',
                      ),
                      MenuItem(
                        title: "Detail",
                        isCondensed: isCondensed,
                        route: '/admin/customers/detail',
                      ),
                      MenuItem(
                        title: "Add",
                        isCondensed: isCondensed,
                        route: '/admin/customers/create',
                      ),
                      MenuItem(
                        title: "Edit",
                        isCondensed: isCondensed,
                        route: '/admin/customers/edit',
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.users,
                    isCondensed: isCondensed,
                    title: "Sellers",
                    children: [
                      MenuItem(
                        title: "List",
                        isCondensed: isCondensed,
                        route: '/admin/sellers',
                      ),
                      MenuItem(
                        title: "Detail",
                        isCondensed: isCondensed,
                        route: '/admin/sellers/detail',
                      ),
                      MenuItem(
                        title: "Add",
                        isCondensed: isCondensed,
                        route: '/admin/sellers/create',
                      ),
                      MenuItem(
                        title: "Edit",
                        isCondensed: isCondensed,
                        route: '/admin/sellers/edit',
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.soup,
                    isCondensed: isCondensed,
                    title: "Restaurant",
                    children: [
                      MenuItem(
                        title: "List",
                        isCondensed: isCondensed,
                        route: '/admin/restaurants',
                      ),
                      MenuItem(
                        title: "Detail",
                        isCondensed: isCondensed,
                        route: '/admin/restaurants/detail',
                      ),
                      MenuItem(
                        title: "Add",
                        isCondensed: isCondensed,
                        route: '/admin/restaurants/create',
                      ),
                      MenuItem(
                        title: "Edit",
                        isCondensed: isCondensed,
                        route: '/admin/restaurants/edit',
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.dessert,
                    isCondensed: isCondensed,
                    title: "Food",
                    children: [
                      MenuItem(
                        title: "List",
                        isCondensed: isCondensed,
                        route: '/admin/food',
                      ),
                      MenuItem(
                        title: "Detail",
                        isCondensed: isCondensed,
                        route: '/admin/food/detail',
                      ),
                      MenuItem(
                        title: "Add",
                        isCondensed: isCondensed,
                        route: '/admin/food/create',
                      ),
                      MenuItem(
                        title: "Edit",
                        isCondensed: isCondensed,
                        route: '/admin/food/edit',
                      ),
                    ],
                  ),
                  NavigationItem(
                    iconData: LucideIcons.wallet2,
                    title: "Wallet",
                    isCondensed: isCondensed,
                    route: '/admin/wallet',
                  ),
                  NavigationItem(
                    iconData: LucideIcons.settings,
                    title: "Setting",
                    isCondensed: isCondensed,
                    route: '/admin/setting',
                  ),
                  labelWidget("UI"),
                  MenuWidget(
                    iconData: LucideIcons.keyRound,
                    isCondensed: isCondensed,
                    title: "Auth",
                    children: [
                      MenuItem(
                        title: 'Login',
                        route: '/auth/login',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: 'Register Password',
                        route: '/auth/register_account',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: 'Forgot Password',
                        route: '/auth/forgot_password',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.component,
                    isCondensed: isCondensed,
                    title: "Widgets",
                    children: [
                      MenuItem(
                        title: "Buttons",
                        route: '/widget/buttons',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Toast",
                        route: '/widget/toast',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Modal",
                        route: '/widget/modal',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Tabs",
                        route: '/widget/tabs',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Cards",
                        route: '/widget/cards',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Loaders",
                        route: '/widget/loader',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Dialog",
                        route: '/widget/dialog',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Carousels",
                        route: '/widget/carousel',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Drag & Drop",
                        route: '/widget/drag_n_drop',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Notifications",
                        route: '/widget/notification',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.bookOpenCheck,
                    title: "Form",
                    isCondensed: isCondensed,
                    children: [
                      MenuItem(
                        title: "Basic Input",
                        route: '/form/basic_input',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Custom Option",
                        route: '/form/custom_option',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Editor",
                        route: '/form/editor',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "File Upload",
                        route: '/form/file_upload',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Slider",
                        route: '/form/slider',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Validation",
                        route: '/form/validation',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Mask",
                        route: '/form/mask',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.shieldAlert,
                    isCondensed: isCondensed,
                    title: "Error",
                    children: [
                      MenuItem(
                        title: 'Error 404',
                        route: '/error/404',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: 'Error 500',
                        route: '/error/500',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: 'Coming Soon',
                        route: '/error/coming_soon',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.bookOpen,
                    isCondensed: isCondensed,
                    title: "Extra Pages",
                    children: [
                      MenuItem(
                        title: 'FAQs',
                        route: '/extra/faqs',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: 'Pricing',
                        route: '/extra/pricing',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: 'Time Line',
                        route: '/extra/time_line',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  NavigationItem(
                    iconData: LucideIcons.table,
                    title: "Basic Table",
                    isCondensed: isCondensed,
                    route: '/other/basic_table',
                  ),
                  MySpacing.height(20),
                  if (!isCondensed)
                    InkWell(
                      onTap: () {
                        UrlService.goToPagger();
                      },
                      child: Padding(
                          padding: MySpacing.x(16),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8), // color: contentTheme.primary.withAlpha(40),
                                gradient:
                                    LinearGradient(colors: const [Colors.deepPurple, Colors.lightBlue], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white.withAlpha(32),
                                  ),
                                  child: Icon(LucideIcons.layoutDashboard, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                MyText.bodyLarge(
                                  "Ready to use page for any Flutter Project",
                                  color: Colors.white,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white,
                                  ),
                                  child: MyText.bodyMedium(
                                    "Free Download",
                                    color: Colors.black,
                                    fontWeight: 600,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  if (isCondensed)
                    InkWell(
                      onTap: () {
                        UrlService.goToPagger();
                      },
                      child: Padding(
                          padding: MySpacing.x(16),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4), // color: contentTheme.primary.withAlpha(40),
                                gradient:
                                    LinearGradient(colors: const [Colors.deepPurple, Colors.lightBlue], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                            child: Icon(
                              LucideIcons.download,
                              color: Colors.white,
                              size: 20,
                            ),
                          )),
                    ),
                  MySpacing.height(20),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget labelWidget(String label) {
    return isCondensed
        ? MySpacing.empty()
        : Container(
            padding: MySpacing.xy(24, 8),
            child: MyText.labelSmall(
              label.toUpperCase(),
              color: leftBarTheme.labelColor,
              muted: true,
              maxLines: 1,
              overflow: TextOverflow.clip,
              fontWeight: 700,
            ),
          );
  }
}

class LabelWidget extends StatefulWidget {
  final bool isCondensed;
  final String label;

  const LabelWidget({super.key, required this.isCondensed, required this.label});

  @override
  State<LabelWidget> createState() => _LabelWidgetState();
}

class _LabelWidgetState extends State<LabelWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isCondensed) {
      return SizedBox();
    }
    return Container(
        margin: MySpacing.fromLTRB(16, 0, 16, 8),
        child: MyText.bodySmall(
          widget.label,
          muted: true,
          fontWeight: 600,
        ));
  }
}

class MenuWidget extends StatefulWidget {
  final IconData iconData;
  final String title;
  final bool isCondensed;
  final bool active;
  final List<MenuItem> children;

  const MenuWidget({super.key, required this.iconData, required this.title, this.isCondensed = false, this.active = false, this.children = const []});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with UIMixin, SingleTickerProviderStateMixin {
  bool isHover = false;
  bool isActive = false;
  late Animation<double> _iconTurns;
  late AnimationController _controller;
  bool popupShowing = true;
  Function? hideFn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _iconTurns = _controller.drive(Tween<double>(begin: 0.0, end: 0.5).chain(CurveTween(curve: Curves.easeIn)));
    LeftbarObserver.attachListener(widget.title, onChangeMenuActive);
  }

  void onChangeMenuActive(String key) {
    if (key != widget.title) {
      onChangeExpansion(false);
    }
  }

  void onChangeExpansion(value) {
    isActive = value;
    if (isActive) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var route = UrlService.getCurrentUrl();
    isActive = widget.children.any((element) => element.route == route);
    onChangeExpansion(isActive);
    if (hideFn != null) {
      hideFn!();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isCondensed) {
      return CustomPopupMenu(
        backdrop: true,
        show: popupShowing,
        hideFn: (hide) => hideFn = hide,
        onChange: (value) {
          popupShowing = value;
        },
        placement: CustomPopupMenuPlacement.right,
        menu: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) {
            setState(() {
              isHover = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHover = false;
            });
          },
          child: MyContainer.transparent(
            margin: MySpacing.fromLTRB(16, 0, 16, 8),
            color: isActive || isHover ? leftBarTheme.activeItemBackground : Colors.transparent,
            padding: MySpacing.xy(8, 8),
            child: Center(
              child: Icon(
                widget.iconData,
                color: (isHover || isActive) ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
                size: 20,
              ),
            ),
          ),
        ),
        menuBuilder: (_) => MyContainer(
          paddingAll: 8,
          borderRadiusAll: 8,
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: widget.children,
          ),
        ),
      );
    } else {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: MyContainer.transparent(
          margin: MySpacing.fromLTRB(24, 0, 16, 0),
          paddingAll: 0,
          child: ListTileTheme(
            contentPadding: const EdgeInsets.all(0),
            dense: true,
            horizontalTitleGap: 0.0,
            minLeadingWidth: 0,
            child: ExpansionTile(
                tilePadding: MySpacing.zero,
                initiallyExpanded: isActive,
                maintainState: true,
                onExpansionChanged: (value) {
                  LeftbarObserver.notifyAll(widget.title);
                  onChangeExpansion(value);
                },
                trailing: RotationTransition(
                  turns: _iconTurns,
                  child: Icon(
                    LucideIcons.chevronDown,
                    size: 18,
                    color: leftBarTheme.onBackground,
                  ),
                ),
                iconColor: leftBarTheme.activeItemColor,
                childrenPadding: MySpacing.x(12),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      widget.iconData,
                      size: 20,
                      color: isHover || isActive ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
                    ),
                    MySpacing.width(18),
                    Expanded(
                      child: MyText.labelLarge(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        color: isHover || isActive ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
                      ),
                    ),
                  ],
                ),
                collapsedBackgroundColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                backgroundColor: Colors.transparent,
                children: widget.children),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    LeftbarObserver.detachListener(widget.title);
  }
}

class MenuItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;

  const MenuItem({
    super.key,
    this.iconData,
    required this.title,
    this.isCondensed = false,
    this.route,
  });

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = UrlService.getCurrentUrl() == widget.route;
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          Get.toNamed(widget.route!);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: MyContainer.transparent(
          margin: MySpacing.fromLTRB(4, 0, 8, 4),
          color: isActive || isHover ? leftBarTheme.activeItemBackground : Colors.transparent,
          width: MediaQuery.of(context).size.width,
          padding: MySpacing.xy(18, 7),
          child: MyText.bodySmall(
            "${widget.isCondensed ? "-" : "- "}  ${widget.title}",
            overflow: TextOverflow.clip,
            maxLines: 1,
            textAlign: TextAlign.left,
            fontSize: 12.5,
            color: isActive || isHover ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
            fontWeight: isActive || isHover ? 600 : 500,
          ),
        ),
      ),
    );
  }
}

class NavigationItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;

  const NavigationItem({super.key, this.iconData, required this.title, this.isCondensed = false, this.route});

  @override
  _NavigationItemState createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = UrlService.getCurrentUrl() == widget.route;
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          Get.toNamed(widget.route!);

          MyRouter.pushReplacementNamed(context, widget.route!, arguments: 1);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: MyContainer(
          margin: MySpacing.fromLTRB(16, 0, 16, 8),
          color: isActive || isHover ? leftBarTheme.activeItemBackground : Colors.transparent,
          padding: MySpacing.xy(8, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.iconData != null)
                Center(
                  child: Icon(
                    widget.iconData,
                    color: (isHover || isActive) ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
                    size: 20,
                  ),
                ),
              if (!widget.isCondensed)
                Flexible(
                  fit: FlexFit.loose,
                  child: MySpacing.width(16),
                ),
              if (!widget.isCondensed)
                Expanded(
                  flex: 3,
                  child: MyText.labelLarge(
                    widget.title,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    color: isActive || isHover ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
