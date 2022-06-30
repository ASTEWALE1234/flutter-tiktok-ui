import 'package:test_demo/model/user.dart';
import 'package:test_demo/model/video.dart';

User demoUser1 = User('Louis', 'assets/usertik1.jpg');
User demoUser2 = User('felegush', 'assets/usertik3.jpg');
User demoUser4 = User('zena', 'assets/usertik6.jpg');
User demoUser3 = User('damtiw', 'assets/usertik2.jpg');
User demoUser5 = User('felegush', 'assets/usertik4.jpg');
User demoUser6 = User('zena', 'assets/usertik5.jpg');
User demoUser7 = User('zena', 'assets/usertik5.jpg');
final List<Video> videos = [
  Video('v1.mp4', demoUser1, 'caption', 'audioName', '72.5k', '1878'),
  Video('v2.mp4', demoUser2, 'caption', 'audioName', '82.5k', '178'),
  Video('v3.mp4', demoUser3, 'caption', 'audioName', '222.5k', '1578'),
  Video('v4.mp4', demoUser4, 'caption', 'audioName', '172.5k', '878'),
  Video('v5.mp4', demoUser5, 'caption', 'audioName', '92.5k', '1178'),
  Video('v6.mp4', demoUser6, 'caption', 'audioName', '2222.5k', '178'),
  Video('v7.mp4', demoUser7, 'caption', 'audioName', '2342.5k', '798'),
];
