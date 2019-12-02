library tyba.ui.widgets;

/// [Dart Packages]
import 'dart:async';

/// [Flutter Packages]
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [Third Part Packages]
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

/// [Tyba Packages]
import 'package:tyba_front_test/src/core/data/models/index.dart';
import 'package:tyba_front_test/src/core/util/index.dart';
import 'package:tyba_front_test/src/ui/shared/index.dart';
import 'package:tyba_front_test/src/ui/views/index.dart';

part './base_model.dart';
part './../views/login_view/widgets/background_clipper.dart';
part './../views/login_view/widgets/social_network_button.dart';
part './../views/login_view/widgets/extra_button.dart';
part './../views/login_view/widgets/input.dart';
part './../views/home_view/widgets/restaurant_card.dart';
part './../views/home_view/widgets/app_bar.dart';
part './../views/home_view/widgets/category_list.dart';
part './../views/home_view/widgets/empty_state.dart';
part './../views/home_view/widgets/loading_state.dart';
part './../views/home_view/widgets/restaurant_list.dart';