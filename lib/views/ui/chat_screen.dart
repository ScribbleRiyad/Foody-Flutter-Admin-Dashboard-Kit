import 'package:flutter/material.dart';
import 'package:foody/controller/ui/chat_controller.dart';
import 'package:foody/helpers/theme/app_themes.dart';
import 'package:foody/helpers/utils/my_shadow.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/utils/utils.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_button.dart';
import 'package:foody/helpers/widgets/my_card.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/my_text_style.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/images.dart';
import 'package:foody/model/chat_model.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late ChatController controller;

  @override
  void initState() {
    controller = Get.put(ChatController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<ChatController>(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Chat",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Chat', active: true),
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
                    MyFlexItem(
                      sizes: 'lg-4',
                      child: MyContainer(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                MyText.titleMedium(
                                  "Messages",
                                  fontWeight: 600,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 650,
                              child: ListView.separated(
                                itemCount: controller.chat.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  Chat message = controller.chat[index];
                                  return MyButton(
                                    onPressed: () {
                                      controller
                                          .onChangeChat(controller.chat[index]);
                                    },
                                    padding: MySpacing.xy(12, 20),
                                    elevation: 0,
                                    borderRadiusAll: 8,
                                    backgroundColor: theme
                                        .colorScheme.surface
                                        .withAlpha(5),
                                    splashColor: theme.colorScheme.onSurface
                                        .withAlpha(10),
                                    child: Row(
                                      children: [
                                        Stack(
                                          alignment: Alignment.bottomLeft,
                                          children: [
                                            MyContainer.rounded(
                                              height: 44,
                                              width: 44,
                                              paddingAll: 0,
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              child: Image.asset(
                                                message.image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              left: 20,
                                              child: MyContainer.rounded(
                                                paddingAll: 2,
                                                child: MyContainer.rounded(
                                                  height: 12,
                                                  color: message.active == true
                                                      ? contentTheme.success
                                                      : contentTheme.danger,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        MySpacing.width(16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  MyText.bodyMedium(
                                                    message.firstName,
                                                    fontWeight: 600,
                                                  ),
                                                  Spacer(),
                                                  MyText.bodySmall(
                                                    '${Utils.getTimeStringFromDateTime(
                                                      controller
                                                          .chat[index].sendAt,
                                                      showSecond: false,
                                                    )}',
                                                    fontWeight: 600,
                                                  ),
                                                ],
                                              ),
                                              MyText.bodyMedium(
                                                message.message,
                                                fontWeight: 600,
                                                overflow: TextOverflow.ellipsis,
                                                xMuted: true,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    height: 20,
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-8  ',
                      child: MyContainer(
                        paddingAll: 0,
                        child: Column(
                          children: [
                            if (controller.singleChat != null)
                              MyCard(
                                shadow: MyShadow(elevation: 0.5),
                                borderRadiusAll: 0,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        MyContainer.rounded(
                                          height: 44,
                                          width: 44,
                                          paddingAll: 0,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.asset(
                                            controller.singleChat!.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          left: 20,
                                          child: MyContainer.rounded(
                                            paddingAll: 2,
                                            child: MyContainer.rounded(
                                              height: 12,
                                              color: controller
                                                          .singleChat!.active ==
                                                      true
                                                  ? contentTheme.success
                                                  : contentTheme.danger,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    MySpacing.width(16),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.titleMedium(
                                          controller.singleChat!.firstName,
                                          fontWeight: 600,
                                        ),
                                        MyText.bodySmall(
                                            controller.singleChat!.active
                                                ? "Online"
                                                : "Offline")
                                      ],
                                    )),
                                    Icon(LucideIcons.phone),
                                    MySpacing.width(16),
                                    Icon(LucideIcons.video),
                                    MySpacing.width(16),
                                    MyContainer.none(
                                      paddingAll: 8,
                                      borderRadiusAll: 5,
                                      child: PopupMenuButton(
                                        offset: const Offset(-10, 10),
                                        position: PopupMenuPosition.under,
                                        itemBuilder: (BuildContext context) => [
                                          PopupMenuItem(
                                            padding: MySpacing.xy(16, 8),
                                            height: 10,
                                            child: MyText.bodySmall(
                                                "View Contact"),
                                          ),
                                          PopupMenuItem(
                                            padding: MySpacing.xy(16, 8),
                                            height: 10,
                                            child: MyText.bodySmall(
                                                "Create Shortcut"),
                                          ),
                                          PopupMenuItem(
                                            padding: MySpacing.xy(16, 8),
                                            height: 10,
                                            child:
                                                MyText.bodySmall("Clear Chat"),
                                          ),
                                          PopupMenuItem(
                                            padding: MySpacing.xy(16, 8),
                                            height: 10,
                                            child: MyText.bodySmall("Block"),
                                          ),
                                        ],
                                        child: const Icon(
                                          LucideIcons.moreVertical,
                                          size: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            Padding(
                              padding: MySpacing.x(16),
                              child: messages(),
                            ),
                            Padding(
                              padding: MySpacing.xy(12, 12),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: MyContainer(
                                  color: contentTheme.secondary.withAlpha(20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller:
                                              controller.messageController,
                                          autocorrect: false,
                                          style: MyTextStyle.bodySmall(),
                                          decoration: InputDecoration(
                                            hintText: "Type message here",
                                            hintStyle: MyTextStyle.bodySmall(
                                                xMuted: true),
                                            border: outlineInputBorder,
                                            enabledBorder: outlineInputBorder,
                                            focusedBorder: focusedInputBorder,
                                            contentPadding:
                                                MySpacing.xy(16, 16),
                                            isCollapsed: true,
                                          ),
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      InkWell(
                                        onTap: () {
                                          controller.sendMessage();
                                        },
                                        child: const Icon(
                                          LucideIcons.send,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget messages() {
    return SizedBox(
      height: 535,
      child: ListView.separated(
        controller: controller.scrollController,
        padding: MySpacing.x(12),
        shrinkWrap: true,
        itemCount: controller.chat.length,
        itemBuilder: (BuildContext context, int index) {
          if (controller.chat[index].fromMe == false) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    MyContainer.rounded(
                      height: 32,
                      width: 32,
                      paddingAll: 0,
                      child: Image.asset(
                        Images.avatars[1],
                        fit: BoxFit.cover,
                      ),
                    ),
                    MySpacing.height(4),
                    MyText.bodySmall(
                      '${Utils.getTimeStringFromDateTime(
                        controller.chat[index].sendAt,
                        showSecond: false,
                      )}',
                      muted: true,
                      fontWeight: 600,
                      fontSize: 8,
                    )
                  ],
                ),
                MySpacing.width(12),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    MyContainer.none(
                      paddingAll: 8,
                      margin: MySpacing.only(
                          top: 10,
                          right: MediaQuery.of(context).size.width * 0.20),
                      alignment: Alignment.bottomRight,
                      borderRadiusAll: 4,
                      color: contentTheme.secondary.withAlpha(30),
                      child: MyText.titleMedium(
                        controller.chat[index].receiveMessage,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        color: contentTheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      MyContainer(
                        paddingAll: 8,
                        margin: MySpacing.only(
                          top: 10,
                          left: MediaQuery.of(context).size.width * 0.20,
                        ),
                        color: contentTheme.secondary.withAlpha(30),
                        child: MyText.bodyMedium(
                          controller.chat[index].sendMessage,
                          fontSize: 12,
                          fontWeight: 600,
                          color: contentTheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                MySpacing.width(12),
                if (controller.singleChat != null)
                  Column(
                    children: [
                      MyContainer.rounded(
                        height: 32,
                        width: 32,
                        paddingAll: 0,
                        child: Image.asset(
                          controller.singleChat!.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      MySpacing.height(4),
                      MyText.bodySmall(
                        '${Utils.getTimeStringFromDateTime(
                          controller.chat[index].sendAt,
                          showSecond: false,
                        )}',
                        fontSize: 8,
                        muted: true,
                        fontWeight: 600,
                      ),
                    ],
                  ),
              ],
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 12,
          );
        },
      ),
    );
  }
}
