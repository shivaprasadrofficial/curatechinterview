import 'package:cura_tech/src/domain/cart/Cart.dart';
import 'package:cura_tech/src/domain/cart/cart_repository.dart';

class GetCartUseCase {
  final CartRepository _cartRepository;

  GetCartUseCase(this._cartRepository);

  Future<Cart> execute() async {
    return _cartRepository.get();
  }
}
