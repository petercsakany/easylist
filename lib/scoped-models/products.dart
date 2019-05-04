import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

mixin ProductsModel on Model {
  List<Product> _products = [];
  int _selectedProductIndex;
  bool _showFavorites = false;

  List<Product> get products {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  Product get selectedProduct {
    if (_selectedProductIndex == null) {
      return null;
    }
    return _products[_selectedProductIndex];
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    notifyListeners();
  }

  void toggleProductFavoriteStatus() {
    if (_selectedProductIndex != null) {
      updateProduct(Product(
          title: selectedProduct.title,
          description: selectedProduct.description,
          image: selectedProduct.image,
          price: selectedProduct.price,
          isFavorite: !selectedProduct.isFavorite));
      notifyListeners();
    }
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
    if( index != null) {
      notifyListeners();
    }
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}
