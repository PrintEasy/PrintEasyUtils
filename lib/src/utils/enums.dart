import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

enum NavItem {
  explore(
    'Explore',
    Icons.explore_outlined,
    Icons.explore_rounded,
  ),
  upload(
    'Upload',
    Icons.cloud_upload_outlined,
    Icons.cloud_upload_rounded,
  ),
  cart(
    'Cart',
    Icons.shopping_cart_outlined,
    Icons.shopping_cart_rounded,
  ),
  orders(
    'Orders',
    Icons.shopping_bag_outlined,
    Icons.shopping_bag_rounded,
  ),
  address(
    'Address',
    Icons.person_pin_circle_outlined,
    Icons.person_pin_circle_rounded,
  ),
  specifications(
    'Specifications',
    Icons.tune_outlined,
    Icons.tune_rounded,
  ),
  aboutUs(
    'About us',
    Icons.info_outlined,
    Icons.info_rounded,
  ),
  help(
    'Help & Support',
    Icons.help_outline_rounded,
    Icons.help_rounded,
  ),
  login(
    'Login or Signup',
    Icons.account_circle_outlined,
    Icons.account_circle_rounded,
  ),
  addText(
    'Add Text',
    Icons.edit_outlined,
    Icons.edit_rounded,
  ),
  color(
    'Text Color',
    Icons.palette_outlined,
    Icons.palette_rounded,
  ),
  font(
    'Font Style',
    Icons.hdr_auto_outlined,
    Icons.hdr_auto_rounded,
  );

  const NavItem(
    this.label,
    this.icon,
    this.selectedIcon,
  );

  final String label;
  final IconData icon;
  final IconData selectedIcon;

  static List<NavItem> get navValues => [
        NavItem.explore,
        NavItem.upload,
        NavItem.cart,
        NavItem.orders,
        NavItem.address,
      ];

  static List<NavItem> get editorValues => [
        NavItem.addText,
        NavItem.color,
        NavItem.font,
        NavItem.upload,
      ];

  static List<NavItem> get options => [
        NavItem.specifications,
        NavItem.aboutUs,
        NavItem.help,
        NavItem.login,
      ];
}

enum LayoutType {
  mobile(PrintEasyConstants.maxMobileWidth),
  tablet(PrintEasyConstants.maxTabletWidth),
  desktop(PrintEasyConstants.maxDesktopWidth),
  desktopLarge(PrintEasyConstants.maxLargeDesktopWidth);

  factory LayoutType.fromWidth(double width) {
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

enum Subcategory {
  notebook('Notebook', 'note-book'),
  alphabetBook('Alphabet Book', null);

  factory Subcategory.fromName(String data) =>
      {
        Subcategory.notebook.name: Subcategory.notebook,
        Subcategory.alphabetBook.name: Subcategory.alphabetBook,
      }[data] ??
      Subcategory.notebook;

  const Subcategory(this.label, this.collection);
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
