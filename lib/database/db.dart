// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DB {
//   //Construtor com acesso privado
//   DB._();

//   // Criar uma instância de DB
//   static final DB instance = DB._();

//   //Instancia do SQLite
//   static Database? _database;

//   get database async {
//     if (_database != null) return _database;

//     return await _initDatabase();
//   }

//   _initDatabase() async {
//     return await openDatabase(
//       join(await getDatabasesPath(), 'pedido.db'),
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   _onCreate(db, version) async {
//     await db.execute(_nome);
//     // await db.execute(_status);
//     // await db.insert('conta', {'saldo': 0});
//   }

//   String get _nome => '''
//     CREATE TABLE pedido (
//       id INTEGER PRIMARY KEY AUTOINCREMENT,
//       nome TEXT,
//       status TEXT,
//       valorTotal REAL,
//     );
//   }
//   ''';
// }
