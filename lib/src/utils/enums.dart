import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

enum RequestType {
  get,
  post,
  // put,
  patch,
  delete,
  // upload;
}

enum LayoutType {
  mobileSmall(PrintEasyConstants.maxSmallMobileWidth),
  mobile(PrintEasyConstants.maxMobileWidth),
  tablet(PrintEasyConstants.maxTabletWidth),
  desktop(PrintEasyConstants.maxDesktopWidth),
  desktopLarge(PrintEasyConstants.maxLargeDesktopWidth);

  factory LayoutType.fromWidth(double width) {
    if (width <= LayoutType.mobileSmall.maxWidth) {
      return LayoutType.mobileSmall;
    }
    if (width <= LayoutType.mobile.maxWidth) {
      return LayoutType.mobile;
    }
    if (width <= LayoutType.tablet.maxWidth) {
      return LayoutType.tablet;
    }
    if (width <= LayoutType.desktop.maxWidth) {
      return LayoutType.desktop;
    }
    return LayoutType.desktopLarge;
  }

  const LayoutType(this.maxWidth);
  final double maxWidth;
}

enum IconPosition {
  leading,
  trailing;
}

enum TermType {
  terms(AssetConstants.termsCondition, 'terms_condition'),
  privacy(AssetConstants.privacyPolicy, 'privacy_policy'),
  refund(AssetConstants.refund, 'refund_policy'),
  shipping(AssetConstants.shipping, 'shipping_policy');

  factory TermType.fromName(String data) =>
      {
        TermType.terms.name.toLowerCase(): TermType.terms,
        TermType.privacy.name.toLowerCase(): TermType.privacy,
        TermType.refund.name.toLowerCase(): TermType.refund,
        TermType.shipping.name.toLowerCase(): TermType.shipping,
      }[data] ??
      TermType.terms;

  factory TermType.fromPath(String data) =>
      {
        TermType.terms.path.toLowerCase(): TermType.terms,
        TermType.privacy.path.toLowerCase(): TermType.privacy,
        TermType.refund.path.toLowerCase(): TermType.refund,
        TermType.shipping.path.toLowerCase(): TermType.shipping,
      }[data] ??
      TermType.terms;

  const TermType(this.icon, this.path);
  final String icon;
  final String path;

  String get route => '/$path';
}

enum OrderStatus {
  paymentPending('Payment Pending', Colors.orange),
  confirmed('Confirmed', Colors.green),
  preparing('Preparing', Colors.blue),
  ready('Ready', Colors.blue),
  shipped('Shipped', Colors.blue),
  outForDelivery('Out for Delivery', Colors.blue),
  delivered('Delivered', Colors.green),
  cancelled('Cancelled', Colors.red),
  returned('Returned', Colors.deepOrange),
  refunded('Refunded', Colors.green);

  factory OrderStatus.fromName(String data) =>
      <String, OrderStatus>{
        OrderStatus.paymentPending.name.toLowerCase(): OrderStatus.paymentPending,
        OrderStatus.confirmed.name.toLowerCase(): OrderStatus.confirmed,
        OrderStatus.preparing.name.toLowerCase(): OrderStatus.preparing,
        OrderStatus.ready.name.toLowerCase(): OrderStatus.ready,
        OrderStatus.shipped.name.toLowerCase(): OrderStatus.shipped,
        OrderStatus.outForDelivery.name.toLowerCase(): OrderStatus.outForDelivery,
        OrderStatus.delivered.name.toLowerCase(): OrderStatus.delivered,
        OrderStatus.cancelled.name.toLowerCase(): OrderStatus.cancelled,
        OrderStatus.returned.name.toLowerCase(): OrderStatus.returned,
        OrderStatus.refunded.name.toLowerCase(): OrderStatus.refunded,
      }[data.toLowerCase()] ??
      OrderStatus.paymentPending;

  const OrderStatus(this.label, this.color);
  final String label;
  final Color color;

  static List<OrderStatus> get visibleValues => [
        OrderStatus.cancelled,
        OrderStatus.confirmed,
        OrderStatus.preparing,
        OrderStatus.ready,
        OrderStatus.shipped,
      ];

  static List<OrderStatus> get actionableValues => [
        OrderStatus.confirmed,
        OrderStatus.preparing,
        OrderStatus.ready,
      ];

  bool get isPaymentPending => this == OrderStatus.paymentPending;
}

enum AddressType {
  shipping('Shipping Address'),
  billing('Billing Address');

  factory AddressType.fromName(String data) =>
      {
        AddressType.shipping.name: AddressType.shipping,
        AddressType.billing.name: AddressType.billing,
      }[data] ??
      AddressType.shipping;

  const AddressType(this.label);
  final String label;

  bool get isBilling => this == AddressType.billing;

  bool get isShipping => this == AddressType.shipping;
}

enum BookType {
  notebook('Notebook', 'note-book'),
  alphabetBook('Alphabet Book', null);

  factory BookType.fromName(String data) =>
      {
        BookType.notebook.name: BookType.notebook,
        BookType.alphabetBook.name: BookType.alphabetBook,
      }[data] ??
      BookType.notebook;

  const BookType(this.label, this.collection);
  final String label;
  final String? collection;
}

enum PropertyType {
  pageSize,
  pageCount,
  bundle;

  factory PropertyType.fromName(String data) =>
      {
        PropertyType.pageSize.name: PropertyType.pageSize,
        PropertyType.pageCount.name: PropertyType.pageCount,
        PropertyType.bundle.name: PropertyType.bundle,
      }[data] ??
      PropertyType.pageSize;
}

enum CustomizationOption {
  withIllustration('With Illustration'),
  withoutIllustration('Without Illustration');

  factory CustomizationOption.fromName(
    String data,
  ) =>
      CustomizationOption.values.byName(
        data,
      );

  const CustomizationOption(this.label);
  final String label;

  bool get isWithIllustration => this == CustomizationOption.withIllustration;
}

enum IllustrationSize {
  small('Small'),
  medium('Medium'),
  large('Large');

  factory IllustrationSize.fromName(String data) => IllustrationSize.values.byName(data.toLowerCase());

  const IllustrationSize(this.label);
  final String label;
}

enum PrintEasyFonts {
  asteroid('Asteroid'),
  beachBikini('BeachBikini'),
  beachside('Beachside'),
  beachSunrise('BeachSunrise'),
  blueberryMuffin('Blueberry Muffin'),
  cakepop('Cakepop'),
  california('California'),
  dearMay('DearMay'),
  firefly('Firefly'),
  forever('Forever'),
  freshLemonade('FreshLemonade'),
  frozen('Frozen'),
  hathway('Hathway'),
  heySugar('HeySugar'),
  honey('Honey'),
  honeycomb('Honeycomb'),
  however('However'),
  iceCream('IceCream'),
  jadeSkies('Jade Skies'),
  joyful('Joyful'),
  loveHearts('LoveHearts'),
  loveMore('Love More'),
  loveVibes('Love Vibes'),
  loveAndHoney('LoveAndHoney'),
  mapleSugar('MapleSugar'),
  meanwhile('Meanwhile'),
  monkey('Monkey'),
  moreLove('MoreLove'),
  pinkRose('Pink Rose'),
  rainbowDreams('RainbowDreams'),
  reality('Reality'),
  scramble('Scramble'),
  somekind('Somekind'),
  sourSlushy('SourSlushy'),
  summerSunshine('SummerSunshine'),
  sunlight('Sunlight'),
  sweetDreams('SweetDreams'),
  theWildOne('TheWildOne'),
  theWildOneFun('TheWildOneFun'),
  theWildOneSolid('TheWildOneSolid'),
  thinker('Thinker'),
  thoughtful('Thoughtful'),
  tigerLand('TigerLand'),
  tigerlily('Tigerlily'),
  ;

  factory PrintEasyFonts.fromName(
    String data,
  ) =>
      data.isEmpty ? PrintEasyFonts.values.first : PrintEasyFonts.values.byName(data);

  const PrintEasyFonts(this.family);
  final String family;
}

enum PrintEasyColors {
  white(Colors.white),
  black(Colors.black),
  red(Colors.red),
  pink(Colors.pink),
  purple(Colors.purple),
  deepPurple(Colors.deepPurple),
  indigo(Colors.indigo),
  blue(Colors.blue),
  lightBlue(Colors.lightBlue),
  cyan(Colors.cyan),
  teal(Colors.teal),
  green(Colors.green),
  lightGreen(Colors.lightGreen),
  lime(Colors.lime),
  yellow(Colors.yellow),
  amber(Colors.amber),
  orange(Colors.orange),
  deepOrange(Colors.deepOrange),
  brown(Colors.brown),
  blueGrey(Colors.blueGrey),
  redAccent(Colors.redAccent),
  pinkAccent(Colors.pinkAccent),
  purpleAccent(Colors.purpleAccent),
  deepPurpleAccent(Colors.deepPurpleAccent),
  indigoAccent(Colors.indigoAccent),
  blueAccent(Colors.blueAccent),
  lightBlueAccent(Colors.lightBlueAccent),
  cyanAccent(Colors.cyanAccent),
  tealAccent(Colors.tealAccent),
  greenAccent(Colors.greenAccent),
  lightGreenAccent(Colors.lightGreenAccent),
  limeAccent(Colors.limeAccent),
  yellowAccent(Colors.yellowAccent),
  amberAccent(Colors.amberAccent),
  orangeAccent(Colors.orangeAccent),
  deepOrangeAccent(Colors.deepOrangeAccent),
  ;

  factory PrintEasyColors.fromName(
    String data,
  ) =>
      data.isEmpty ? PrintEasyColors.values.first : PrintEasyColors.values.byName(data);

  const PrintEasyColors(this.color);
  final Color color;
}


enum GiftType {
  discount, // e.g. 10% OFF
  product, // e.g. Free tote bag
  freeDelivery, // e.g. Free shipping
  other // Fallback/default type
}