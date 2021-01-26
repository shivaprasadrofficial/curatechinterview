import 'package:cura_tech/src/domain/cart/Cart.dart';
import 'package:cura_tech/src/domain/cart/CartItem.dart';
import 'package:cura_tech/src/domain/cart/cart_repository.dart';

class EditQuantityOfCartItemUseCase {
  final CartRepository _cartRepository;

  EditQuantityOfCartItemUseCase(this._cartRepository);

  Future<Cart> execute(CartItem cartItem, int quantity) async {
    final cart = await _cartRepository.get();

    final editedCart = cart.editItem(cartItem, quantity);

    await _cartRepository.save(editedCart);

    return editedCart;
  }
}
