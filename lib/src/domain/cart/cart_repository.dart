import 'package:cura_tech/src/domain/cart/Cart.dart';

abstract class CartRepository {
  Future<Cart> get();

  Future<bool> save(Cart cart);
}
