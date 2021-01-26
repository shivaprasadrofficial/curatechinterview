import 'package:cura_tech/src/domain/products/product.dart';
import 'package:cura_tech/src/domain/products/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository _productRepository;

  GetProductsUseCase(this._productRepository);

  Future<List<Product>> execute() {
    return _productRepository.get();
  }
}
