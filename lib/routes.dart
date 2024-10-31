import 'package:flutter/material.dart';
import 'package:foody/helpers/services/auth_services.dart';
import 'package:foody/views/auth/forgot_password_screen.dart';
import 'package:foody/views/auth/login_screen.dart';
import 'package:foody/views/auth/register_account_screen.dart';
import 'package:foody/views/ui/basic_table_screen.dart';
import 'package:foody/views/ui/buttons_screen.dart';
import 'package:foody/views/ui/cards_screen.dart';
import 'package:foody/views/ui/carousels_screen.dart';
import 'package:foody/views/ui/cart_screen.dart';
import 'package:foody/views/home_screen.dart';
import 'package:foody/views/ui/customer/edit_customer_screen.dart';
import 'package:foody/views/ui/dialogs_screen.dart';
import 'package:foody/views/ui/drag_n_drop_screen.dart';
import 'package:foody/views/ui/error_pages/coming_soon_screen.dart';
import 'package:foody/views/ui/error_pages/error_404_screen.dart';
import 'package:foody/views/ui/error_pages/error_500_screen.dart';
import 'package:foody/views/ui/extra_pages/faqs_screen.dart';
import 'package:foody/views/ui/extra_pages/pricing_screen.dart';
import 'package:foody/views/ui/extra_pages/time_line_screen.dart';
import 'package:foody/views/ui/food/add_food_screen.dart';
import 'package:foody/views/ui/food/food_detail_screen.dart';
import 'package:foody/views/ui/food/food_edit_screen.dart';
import 'package:foody/views/ui/forms/basic_input_screen.dart';
import 'package:foody/views/ui/forms/custom_option_screen.dart';
import 'package:foody/views/ui/forms/editor_screen.dart';
import 'package:foody/views/ui/forms/file_upload_screen.dart';
import 'package:foody/views/ui/forms/mask_screen.dart';
import 'package:foody/views/ui/forms/slider_screen.dart';
import 'package:foody/views/ui/forms/validation_screen.dart';
import 'package:foody/views/ui/loaders_screen.dart';
import 'package:foody/views/ui/modal_screen.dart';
import 'package:foody/views/ui/notification_screen.dart';
import 'package:foody/views/ui/order_screen.dart';
import 'package:foody/views/ui/food/food_list_screen.dart';
import 'package:foody/views/ui/foods_screen.dart';
import 'package:foody/views/ui/restaurants/add_restaurant_screen.dart';
import 'package:foody/views/ui/restaurants/edit_restaurant_screen.dart';
import 'package:foody/views/ui/restaurants/restaurant_list_screen.dart';
import 'package:foody/views/ui/restaurants/restaurant_detail_screen.dart';
import 'package:foody/views/ui/chat_screen.dart';
import 'package:foody/views/ui/customer/add_customer_screen.dart';
import 'package:foody/views/ui/customer/customer_detail_screen.dart';
import 'package:foody/views/ui/customer/customer_list_screen.dart';
import 'package:foody/views/ui/dashboard_screen.dart';
import 'package:foody/views/ui/order/order_detail_screen.dart';
import 'package:foody/views/ui/order/order_list_screen.dart';
import 'package:foody/views/ui/seller/add_seller_screen.dart';
import 'package:foody/views/ui/seller/seller_detail_screen.dart';
import 'package:foody/views/ui/seller/seller_edit_screen.dart';
import 'package:foody/views/ui/seller/seller_list_screen.dart';
import 'package:foody/views/ui/setting_screen.dart';
import 'package:foody/views/ui/tabs_screen.dart';
import 'package:foody/views/ui/toast_message_screen.dart';
import 'package:foody/views/ui/wallet_screen.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthService.isLoggedIn ? null : const RouteSettings(name: '/auth/login');
  }
}

getPageRoute() {
  var routes = [
    GetPage(name: '/', page: () => const HomeScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/home', page: () => const HomeScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/dashboard', page: () => const DashboardScreen(), middlewares: [AuthMiddleware()]),

    ///*************AUTH*************///
    GetPage(name: '/auth/login', page: () => const LoginScreen()),
    GetPage(name: '/auth/register_account', page: () => const RegisterAccountScreen()),
    GetPage(name: '/auth/forgot_password', page: () => const ForgotPasswordScreen()),

    ///*************PAGES*************///

    ///Chat
    GetPage(name: '/chat', page: () => const ChatScreen(), middlewares: [AuthMiddleware()]),

    /// Orders
    GetPage(name: '/admin/orders', page: () => const OrderListScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/orders/detail', page: () => const OrderDetailScreen(), middlewares: [AuthMiddleware()]),

    /// Customers
    GetPage(name: '/admin/customers', page: () => const CustomerListScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/customers/detail', page: () => const CustomerDetailScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/customers/create', page: () => const AddCustomerScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/customers/edit', page: () => const EditCustomerScreen(), middlewares: [AuthMiddleware()]),

    /// Seller
    GetPage(name: '/admin/sellers', page: () => const SellerListScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/sellers/detail', page: () => const SellerDetailScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/sellers/create', page: () => const AddSellerScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/sellers/edit', page: () => const SellerEditScreen(), middlewares: [AuthMiddleware()]),

    /// Restaurants
    GetPage(name: '/admin/restaurants', page: () => const RestaurantsListScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/restaurants/detail', page: () => const RestaurantDetailScreen(), middlewares: [AuthMiddleware()]),

    GetPage(name: '/admin/restaurants/create', page: () => const AddRestaurantScreen(), middlewares: [AuthMiddleware()]),

    GetPage(name: '/admin/restaurants/edit', page: () => const EditRestaurantScreen(), middlewares: [AuthMiddleware()]),

    /// Cart

    GetPage(name: '/cart', page: () => const CartScreen(), middlewares: [AuthMiddleware()]),

    /// Food
    GetPage(name: '/admin/food', page: () => const FoodListScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/food/detail', page: () => const FoodDetailScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/food/create', page: () => const AddFoodScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/admin/food/edit', page: () => const FoodEditScreen(), middlewares: [AuthMiddleware()]),

    /// Foods
    GetPage(name: '/foods', page: () => const FoodsScreen(), middlewares: [AuthMiddleware()]),

    /// Order
    GetPage(name: '/orders', page: () => const OrderScreen(), middlewares: [AuthMiddleware()]),

    /// Wallet
    GetPage(name: '/admin/wallet', page: () => const WalletScreen(), middlewares: [AuthMiddleware()]),

    /// Setting
    GetPage(name: '/admin/setting', page: () => const SettingScreen(), middlewares: [AuthMiddleware()]),

    /// UI
    GetPage(name: '/widget/buttons', page: () => const ButtonsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widget/toast', page: () => const ToastMessageScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widget/modal', page: () => const ModalScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widget/tabs', page: () => const TabsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widget/cards', page: () => const CardsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widget/loader', page: () => const LoadersScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widget/dialog', page: () => const DialogsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widget/carousel', page: () => const CarouselsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widget/drag_n_drop', page: () => const DragNDropScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/widget/notification', page: () => const NotificationScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/basic_input', page: () => const BasicInputScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/custom_option', page: () => const CustomOptionScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/editor', page: () => const EditorScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/file_upload', page: () => const FileUploadScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/slider', page: () => const SliderScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/validation', page: () => const ValidationScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/form/mask', page: () => const MaskScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/error/coming_soon', page: () => ComingSoonScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/error/500', page: () => Error500Screen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/error/404', page: () => Error404Screen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/extra/time_line', page: () => TimeLineScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/extra/pricing', page: () => PricingScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/extra/faqs', page: () => FaqsScreen(), middlewares: [AuthMiddleware()]),
    GetPage(name: '/other/basic_table', page: () => BasicTableScreen(), middlewares: [AuthMiddleware()]),
  ];
  return routes.map((e) => GetPage(name: e.name, page: e.page, middlewares: e.middlewares, transition: Transition.noTransition)).toList();
}
