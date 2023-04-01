import 'package:path/path.dart'; // db에 접근하기 위해
import 'package:quiz_demo/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final String tableName = 'notes';
  final int _version = 1; // 데이터베이스 버전
  static Database? _database; //SQLite 데이터베이스

  static final DatabaseHelper db = DatabaseHelper._internal();

  // 처음 인스턴스 만들 때 실행되는 코드로 1회 발생 (초기화 코드)
  DatabaseHelper._internal();

  // singleton 패턴 구현에 사용
  // 새로운 인스턴스를 생성하지 않고, 클래스의 인스턴스 반환 (무조건 하나의 인스턴스)
  factory DatabaseHelper() => db;

  Future<Database> get database async =>
      // db가 null인 경우 openDatabase를 통해 데이터베이스 열어야함
      _database ??= await _initDB('note.db');

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    // onCreate 버전이 다른 경우, 지정된 경로의 데이터베이스를 찾을 수 없을 경우
    return await openDatabase(path, version: _version, onCreate: _createDB);
  }

  // table 생성
  Future _createDB(Database database, int version) async {
    // NULL, INTEGER, REAL, TEXT, BLOB 5가지 datatype
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';
    const integerType = 'INTEGER';
    const dateType = 'DATE';
    const boolType = 'BOOLEAN';

    await database.execute(
        '''CREATE TABLE $tableName (id $idType, title $textType, body $textType, createDate $textType)''');
  }

  Future addNote(NoteModel note) async {
    final db = await database;

    db.insert('notes', note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<dynamic> getAllNotes() async {
    final db = await database;

    final orderBy = 'createDate ASC';

    var maps = await db.query('notes', orderBy: orderBy);

    if (maps.isEmpty) {
      return null;
    } else {
      return maps.toList();
    }
  }

  // 앱이 종료되면, DB 자동으로 닫히지만,
  // 원할 때 종료하고 싶은 경우  사용됨.
  Future close() async {
    final db = await database;

    db.close();
  }
}
