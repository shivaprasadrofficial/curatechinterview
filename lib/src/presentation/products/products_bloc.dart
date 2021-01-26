import 'package:intl/intl.dart';
import 'package:cura_tech/src/common/bloc/bloc.dart';
import 'package:cura_tech/src/domain/products/get_products_use_case.dart';
import 'package:cura_tech/src/domain/products/product.dart';
import 'package:cura_tech/src/presentation/products/products_state.dart';

class ProductsBloc extends Bloc<ProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductsBloc(this._getProductsUseCase) {
    changeState(ProductsState.loading(searchTerm: ''));
  }

  void search(String searchTerm) {
    _getProductsUseCase.execute().then((products) {
      changeState(ProductsState.loaded(
          state.searchTerm, _mapProductsToState(products)));
    }).catchError((error) {
      changeState(
          ProductsState.error(state.searchTerm, 'A network error has ocurrd'));
    });
  }

  List<ProductItemState> _mapProductsToState(List<Product> products) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'en_IN');

    return products
        .map((product) => ProductItemState(product.id, product.image,
            product.title, formatCurrency.format(product.price)))
        .toList();
  }
}
