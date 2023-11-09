import '../../Features/Checkout/data/model/amount_model/amount_model.dart';
import '../../Features/Checkout/data/model/amount_model/details.dart';
import '../../Features/Checkout/data/model/item_list_model/item.dart';
import '../../Features/Checkout/data/model/item_list_model/item_list_model.dart';

({AmountModel amount, ItemListModel itemList}) getTransctionsData() {
  var amount = AmountModel(
      total: "100",
      currency: 'USD',
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'));

  List<OrderItemModel> orders = [
    OrderItemModel(
      currency: 'USD',
      name: 'Apple',
      price: "4",
      quantity: 10,
    ),
    OrderItemModel(
      currency: 'USD',
      name: 'Apple',
      price: "5",
      quantity: 12,
    ),
  ];

  var itemList = ItemListModel(orders: orders);

  return (amount: amount, itemList: itemList);
}