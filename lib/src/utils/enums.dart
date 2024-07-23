import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

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
