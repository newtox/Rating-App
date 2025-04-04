import 'package:get/get.dart';
import 'package:rating_app/app/data/models/create_room/create_room_screen.dart';
import 'package:rating_app/app/data/models/home/home_screen.dart';
import 'package:rating_app/app/data/models/join_room/join_room_screen.dart';
import 'package:rating_app/app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.createRoom, page: () => const CreateRoomScreen()),
    GetPage(name: AppRoutes.joinRoom, page: () => const JoinRoomScreen()),
  ];
}
