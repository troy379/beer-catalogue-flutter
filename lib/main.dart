import 'package:flutter/material.dart';
import 'package:beer_catalogue_flutter/app.dart';
import 'package:beer_catalogue_flutter/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServiceLocator.initializeDependencies();
  runApp(const BeerCatalogueApp());
}
