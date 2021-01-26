import 'package:cura_tech/src/domain/cart/Cart.dart';
import 'package:cura_tech/src/domain/cart/CartItem.dart';
import 'package:cura_tech/src/domain/cart/cart_repository.dart';

class RemoveItemFromCartUseCase {
  final CartRepository _cartRepository;

  RemoveItemFromCartUseCase(this._cartRepository);

  Future<Cart> execute(CartItem cartItem) async {
    final cart = await _cartRepository.get();

    final editedCart = cart.removeItem(cartItem);

    await _cartRepository.save(editedCart);

    return editedCart;
  }
}
