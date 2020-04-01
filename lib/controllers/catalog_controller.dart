import 'package:flutter_boiler_plate/base/controller.dart';
import 'package:flutter_boiler_plate/models/catalog_model.dart';
import 'package:flutter_boiler_plate/repositories/catalog_repositories.dart';

class CatalogController extends Controller {
  final _catalogRepository = CatalogRepository();
  List<Catalog> _items = [];
  List<Catalog> get catalogs => _items;

  CatalogController() {
    init();
  }

  init() async {
    // initial sample data here.
    await addCatalog();
    await addCatalog();
    // end
    await getCatalogs();
  }

  Future getCatalogs() async {
    _items = await _catalogRepository.getCatalogs();
    notifyListeners();
  }

  Future addCatalog() async {
    await _catalogRepository.addCatalog();
    await getCatalogs();
    notifyListeners();
  }

  Future clearCatalogs() async {
    await _catalogRepository.clearCatalogs();
    await getCatalogs();
  }

  @override
  void initListeners() {}
}
