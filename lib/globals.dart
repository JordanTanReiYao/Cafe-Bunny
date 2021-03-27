library globals;

import 'package:Cafe_Bunny/classes/couponClass.dart';
import 'package:flutter/cupertino.dart';

String playerName = 'Ask Ketchum';
String playerTitle = 'Cultured Bunny';
int playerLevel = 1;
double hopCount = 0;
int expFlag = 0;

bool babybunny = false;
bool buffetbunny = false;
bool superbunny = false;

bool coupon1 = false;
bool coupon2 = false;
bool coupon3 = false;
bool coupon4 = false;

List<Coupon> inventory = [];

int index = 1;

AssetImage avatar(int index){
  switch(index) {
    case 1: return (AssetImage('assets/avatar1.png'));
    break;
    case 2: return (AssetImage('assets/avatar2.png'));
    break;
    case 3: return (AssetImage('assets/avatar3.png'));
    break;
    case 4: return (AssetImage('assets/avatar4.png'));
    break;
    case 5: return (AssetImage('assets/avatar5.png'));
    break;
    case 6: return (AssetImage('assets/avatar6.png'));
    break;
    case 7: return (AssetImage('assets/avatar7.png'));
    break;
    case 8: return (AssetImage('assets/avatar8.png'));
    break;
    case 9: return (AssetImage('assets/avatar9.png'));
    break;
    case 10: return (AssetImage('assets/avatar10.png'));
    break;
    default: return (AssetImage('assets/sampleprofilepic.png'));
    break;
  }
}