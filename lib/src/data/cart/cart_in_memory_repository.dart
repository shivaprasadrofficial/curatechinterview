import 'dart:convert';

import 'package:cura_tech/src/domain/cart/Cart.dart';
import 'package:cura_tech/src/domain/cart/CartItem.dart';
import 'package:cura_tech/src/domain/cart/cart_repository.dart';

const jsonCart = '''[
  {
    "id": "1",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600082913/cropped/vl3kxion1sm0hceui05s.jpg",
    "title": "CZ 3",
    "price": 16.75,
    "quantity": 1
  },
  {
    "id": "2",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600071463/cropped/zu5bir6okjywrm4ymezg.jpg",
    "title": "Avil NU 10",
    "price": 14.50,
    "quantity": 1
  }
  ]''';

class CartInMemoryRepository implements CartRepository {
  Cart cart = Cart.createEmpty();

  CartInMemoryRepository() {
    cart = _parse(jsonDecode(jsonCart));
  }

  @override
  Future<Cart> get() async {
    return Future.delayed(const Duration(milliseconds: 100), () => cart);
  }

  @override
  Future<bool> save(Cart cart) async {
    return Future.delayed(const Duration(milliseconds: 100), () {
      this.cart = cart;
      return true;
    });
  }

  Cart _parse(List<dynamic> json) {
    return Cart(json
        .map((jsonItem) => CartItem(jsonItem['id'], jsonItem['image'],
            jsonItem['title'], jsonItem['price'], jsonItem['quantity']))
        .toList());
  }
}
