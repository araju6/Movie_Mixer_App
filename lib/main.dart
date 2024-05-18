import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:movie_mixer/data/tables/movie_history_table.dart';
import 'package:movie_mixer/data/tables/movie_table.dart';
import 'package:movie_mixer/presentation/movie_app.dart';

import 'data/tables/movie_watchlist_table.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 unawaited(
   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
 );
 final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
 Hive.init(appDocumentDir.path);
 Hive.registerAdapter(MovieTableAdapter());
 Hive.registerAdapter(MovieWatchlistTableAdapter());
 Hive.registerAdapter(MovieHistoryTableAdapter());

 unawaited(getIt.init());
 runApp(MovieApp());
}
