import 'package:note_app/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final String tableName = 'notes';
  final int _version = 1; // database 버전
  static Database? _database; // SQLite 데이터베이스

  static final DatabaseHelper db = DatabaseHelper._internal();

  // 인스턴스 최초로 생성할 때, 한 번 실행되는 코드 (초기화 코드)
  DatabaseHelper._internal();

  // singleton 패턴 구현에 사용
  // 새로운 인스턴스를 생성하지 않고, 이미 생성된 클래스의 인스턴스를 반환 (생성자를 여러 번 호출해도 무조건 하나의 인스턴스)
  factory DatabaseHelper() => db;

  Future<Database> get database async =>
      // _database가 null일 때, _initDB 함수를 실행하고, null이 아닐 때는 이미 기존에 있는 database를 반환
      _database ??= await _initDB('note.db');

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: _version, onCreate: _createDB);
  }

  // table 생성
  Future _createDB(Database database, int version) async {
    // NULL, INTEGER, REAL, TEXT, DATE, BOOLEAN (datatype)
    const idTye = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';

    await database.execute('''
      CREATE TABLE $tableName (id $idTye, title $textType, body $textType, createDate $textType)
      ''');
  }

  // Create
  Future addNote(NoteModel note) async {
    final db = await database;

    db.insert(tableName, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Read
  Future<List?> getAllNotes() async {
    final db = await database;

    final orderBy = 'id ASC';

    var maps = await db.query(tableName, orderBy: orderBy);

    if (maps.isEmpty) {
      return null;
    } else {
      return maps;
    }
  }

  Future closeDB() async {
    final db = await database;

    db.close();
  }
}
