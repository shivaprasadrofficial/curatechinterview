import 'package:cura_tech/src/domain/products/product.dart';

abstract class ProductRepository {
  Future<List<Product>> get();
}
