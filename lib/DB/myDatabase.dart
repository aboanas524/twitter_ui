import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'myDatabase.g.dart';

class Post extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  DateTimeColumn get datePost => dateTime()();
  IntColumn get person => integer()();
  IntColumn get parentPostId => integer().nullable()();
  TextColumn get imageProfileImage => text()();
  TextColumn get personName => text()();
  TextColumn get personUsername => text()();

}
class Profile extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get userName => text()();
  TextColumn get email => text()();
  TextColumn get password => text()();
  DateTimeColumn get birthday => dateTime()();
  TextColumn get imagePersonUrl => text()();
}

@DriftDatabase(tables: [Post,Profile])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future addPost (PostData data)async{
    await into(post).insert(data);
  }
  Future<bool> addProfile (ProfileData data)async{
    await into(profile).insert(data);
    return true;
  }
  Future<void> deletePost(PostData postData)async{
    await delete(post).delete(postData);
  }
  Future<ProfileData?> login(String email,String password)async
  {
    return await (select(profile)..where((tbl) => tbl.email.equals(email)&tbl.password.equals(password))).getSingleOrNull();
  }
  Future<ProfileData?> getProfile(int profileId)async{
    return await (select(profile)..where((tbl) => tbl.id.equals(profileId))).getSingleOrNull();
  }

  Future<List<PostData>> getPosts ()async{
    return await (select(post)..where((tbl) => tbl.parentPostId.isNull())).get();
  }
  Stream<List<PostData>> getPostsWatch (){
    return (select(post)..where((tbl) => tbl.parentPostId.isNull())).watch();
  }

  Future<List<PostData>> getPostComments (int postId)async{
    return await (select(post)..where((tbl) => tbl.parentPostId.equals(postId))).get();
  }
  Stream<List<PostData>> getPostCommentsWatch (int postId){
    return  (select(post)..where((tbl) => tbl.parentPostId.equals(postId))).watch();
  }

  Future<List<PostData>> getPostsByPerson (int personId)async{
    return await (select(post)..where((tbl) => tbl.person.equals(personId)&tbl.parentPostId.isNull())).get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}