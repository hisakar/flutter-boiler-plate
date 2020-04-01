import 'package:flutter_boiler_plate/file/catalog_file.dart';
import 'package:flutter_boiler_plate/models/catalog_model.dart';
import 'package:flutter_boiler_plate/utils/helps.dart';

class CatalogMemory {
  CatalogMemory() {
    initCatalogs();
  }
  Future initCatalogs() async {
    catalogList.clear();
  }

  Future<List> getCatalogs() async {
    return catalogList;
  }

  Future<int> addCatalog() async {
    Map<String, dynamic> randomJson = Helper.makeRandCatalog(
      catalogList.length,
    );
    Catalog randomCatalog = Catalog.fromJson(randomJson);
    catalogList.add(randomCatalog);
    return catalogList.length + 1;
  }

  Future clearCatalogs() async {
    var result = await catalogList.clear();
    return result;
  }
}