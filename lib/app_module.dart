import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greisy_photos/features/landing_page/presentation/pages/mobile/mobile_landing_page.dart';
import 'package:greisy_photos/features/user_profile/presentation/widgets/user_profile_handler.dart';

import 'core/constants/routes.dart';
import 'features/landing_page/presentation/pages/desktop/desktop_landing_page.dart';
import 'features/landing_page/presentation/pages/responsive_layout.dart';
import 'features/landing_page/presentation/pages/tablet/table_landing_page.dart';
import 'features/photo_details/presentation/pages/mobile/mobile_photo_details_handler.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => <Bind<Object>>[];

  @override
  List<ModularRoute> get routes => <ModularRoute>[
        ChildRoute<dynamic>(
          Modular.initialRoute,
          child: (
            BuildContext context,
            dynamic args,
          ) =>
              const ResponsiveLayout(
            desktopPage: DesktopLandingPage(),
            mobilePage: MobileLandingPage(),
            tabletPage: TabletLandingPage(),
          ),
        ),
        ChildRoute<dynamic>('$imageDetailsPageRouteName/:photoId',
            transition: TransitionType.leftToRight,
            child: (BuildContext context, args) {
          return MobilePhotoDetailsHandler(photoId: args.params['photoId']);
        }),
        ChildRoute<dynamic>('$userProfilePageRouteName/:userName',
            transition: TransitionType.fadeIn,
            child: (BuildContext context, args) {
          return MobileUserProfileHandler(userName: args.params['userName']);
        }),
      ];
}
