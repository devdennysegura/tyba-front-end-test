part of  tyba.ui.shared;

class UIHelper {
  
  static const double VerticalSpaceSmall = 16.0;
  static const double VerticalSpaceMedium = 24.0;
  static const double VerticalSpaceLarge = 32.0;

  static const double HorizontalSpaceSmall = 16.0;
  static const double HorizontalSpaceMedium = 24.0;
  static const double HorizontalSpaceLarge = 32.0;

  static Widget verticalSpaceSmall() {
    return verticalSpace(VerticalSpaceSmall);
  }

  static Widget verticalSpaceMedium() {
    return verticalSpace(VerticalSpaceMedium);
  }

  static Widget verticalSpaceLarge() {
    return verticalSpace(VerticalSpaceLarge);
  }

  static Widget verticalSpace(double height) {
    return SizedBox(height: height);
  }

  static Widget horizontalSpaceSmall() {
    return horizontalSpace(HorizontalSpaceSmall);
  }

  static Widget horizontalSpaceMedium() {
    return horizontalSpace(HorizontalSpaceMedium);
  }

  static Widget horizontalSpaceLarge() {
    return horizontalSpace(HorizontalSpaceLarge);
  }

  static Widget horizontalSpace(double width) {
    return SizedBox(width: width);
  }
}
