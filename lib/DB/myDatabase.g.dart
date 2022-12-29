// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myDatabase.dart';

// ignore_for_file: type=lint
class PostData extends DataClass implements Insertable<PostData> {
  final int id;
  final String title;
  final DateTime datePost;
  final int person;
  final int? parentPostId;
  final String imageProfileImage;
  final String personName;
  final String personUsername;
  const PostData(
      {required this.id,
      required this.title,
      required this.datePost,
      required this.person,
      this.parentPostId,
      required this.imageProfileImage,
      required this.personName,
      required this.personUsername});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['date_post'] = Variable<DateTime>(datePost);
    map['person'] = Variable<int>(person);
    if (!nullToAbsent || parentPostId != null) {
      map['parent_post_id'] = Variable<int>(parentPostId);
    }
    map['image_profile_image'] = Variable<String>(imageProfileImage);
    map['person_name'] = Variable<String>(personName);
    map['person_username'] = Variable<String>(personUsername);
    return map;
  }

  PostCompanion toCompanion(bool nullToAbsent) {
    return PostCompanion(
      id: Value(id),
      title: Value(title),
      datePost: Value(datePost),
      person: Value(person),
      parentPostId: parentPostId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentPostId),
      imageProfileImage: Value(imageProfileImage),
      personName: Value(personName),
      personUsername: Value(personUsername),
    );
  }

  factory PostData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      datePost: serializer.fromJson<DateTime>(json['datePost']),
      person: serializer.fromJson<int>(json['person']),
      parentPostId: serializer.fromJson<int?>(json['parentPostId']),
      imageProfileImage: serializer.fromJson<String>(json['imageProfileImage']),
      personName: serializer.fromJson<String>(json['personName']),
      personUsername: serializer.fromJson<String>(json['personUsername']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'datePost': serializer.toJson<DateTime>(datePost),
      'person': serializer.toJson<int>(person),
      'parentPostId': serializer.toJson<int?>(parentPostId),
      'imageProfileImage': serializer.toJson<String>(imageProfileImage),
      'personName': serializer.toJson<String>(personName),
      'personUsername': serializer.toJson<String>(personUsername),
    };
  }

  PostData copyWith(
          {int? id,
          String? title,
          DateTime? datePost,
          int? person,
          Value<int?> parentPostId = const Value.absent(),
          String? imageProfileImage,
          String? personName,
          String? personUsername}) =>
      PostData(
        id: id ?? this.id,
        title: title ?? this.title,
        datePost: datePost ?? this.datePost,
        person: person ?? this.person,
        parentPostId:
            parentPostId.present ? parentPostId.value : this.parentPostId,
        imageProfileImage: imageProfileImage ?? this.imageProfileImage,
        personName: personName ?? this.personName,
        personUsername: personUsername ?? this.personUsername,
      );
  @override
  String toString() {
    return (StringBuffer('PostData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('datePost: $datePost, ')
          ..write('person: $person, ')
          ..write('parentPostId: $parentPostId, ')
          ..write('imageProfileImage: $imageProfileImage, ')
          ..write('personName: $personName, ')
          ..write('personUsername: $personUsername')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, datePost, person, parentPostId,
      imageProfileImage, personName, personUsername);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostData &&
          other.id == this.id &&
          other.title == this.title &&
          other.datePost == this.datePost &&
          other.person == this.person &&
          other.parentPostId == this.parentPostId &&
          other.imageProfileImage == this.imageProfileImage &&
          other.personName == this.personName &&
          other.personUsername == this.personUsername);
}

class PostCompanion extends UpdateCompanion<PostData> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> datePost;
  final Value<int> person;
  final Value<int?> parentPostId;
  final Value<String> imageProfileImage;
  final Value<String> personName;
  final Value<String> personUsername;
  const PostCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.datePost = const Value.absent(),
    this.person = const Value.absent(),
    this.parentPostId = const Value.absent(),
    this.imageProfileImage = const Value.absent(),
    this.personName = const Value.absent(),
    this.personUsername = const Value.absent(),
  });
  PostCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required DateTime datePost,
    required int person,
    this.parentPostId = const Value.absent(),
    required String imageProfileImage,
    required String personName,
    required String personUsername,
  })  : title = Value(title),
        datePost = Value(datePost),
        person = Value(person),
        imageProfileImage = Value(imageProfileImage),
        personName = Value(personName),
        personUsername = Value(personUsername);
  static Insertable<PostData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? datePost,
    Expression<int>? person,
    Expression<int>? parentPostId,
    Expression<String>? imageProfileImage,
    Expression<String>? personName,
    Expression<String>? personUsername,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (datePost != null) 'date_post': datePost,
      if (person != null) 'person': person,
      if (parentPostId != null) 'parent_post_id': parentPostId,
      if (imageProfileImage != null) 'image_profile_image': imageProfileImage,
      if (personName != null) 'person_name': personName,
      if (personUsername != null) 'person_username': personUsername,
    });
  }

  PostCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<DateTime>? datePost,
      Value<int>? person,
      Value<int?>? parentPostId,
      Value<String>? imageProfileImage,
      Value<String>? personName,
      Value<String>? personUsername}) {
    return PostCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      datePost: datePost ?? this.datePost,
      person: person ?? this.person,
      parentPostId: parentPostId ?? this.parentPostId,
      imageProfileImage: imageProfileImage ?? this.imageProfileImage,
      personName: personName ?? this.personName,
      personUsername: personUsername ?? this.personUsername,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (datePost.present) {
      map['date_post'] = Variable<DateTime>(datePost.value);
    }
    if (person.present) {
      map['person'] = Variable<int>(person.value);
    }
    if (parentPostId.present) {
      map['parent_post_id'] = Variable<int>(parentPostId.value);
    }
    if (imageProfileImage.present) {
      map['image_profile_image'] = Variable<String>(imageProfileImage.value);
    }
    if (personName.present) {
      map['person_name'] = Variable<String>(personName.value);
    }
    if (personUsername.present) {
      map['person_username'] = Variable<String>(personUsername.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('datePost: $datePost, ')
          ..write('person: $person, ')
          ..write('parentPostId: $parentPostId, ')
          ..write('imageProfileImage: $imageProfileImage, ')
          ..write('personName: $personName, ')
          ..write('personUsername: $personUsername')
          ..write(')'))
        .toString();
  }
}

class $PostTable extends Post with TableInfo<$PostTable, PostData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _datePostMeta =
      const VerificationMeta('datePost');
  @override
  late final GeneratedColumn<DateTime> datePost = GeneratedColumn<DateTime>(
      'date_post', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _personMeta = const VerificationMeta('person');
  @override
  late final GeneratedColumn<int> person = GeneratedColumn<int>(
      'person', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _parentPostIdMeta =
      const VerificationMeta('parentPostId');
  @override
  late final GeneratedColumn<int> parentPostId = GeneratedColumn<int>(
      'parent_post_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _imageProfileImageMeta =
      const VerificationMeta('imageProfileImage');
  @override
  late final GeneratedColumn<String> imageProfileImage =
      GeneratedColumn<String>('image_profile_image', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _personNameMeta =
      const VerificationMeta('personName');
  @override
  late final GeneratedColumn<String> personName = GeneratedColumn<String>(
      'person_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _personUsernameMeta =
      const VerificationMeta('personUsername');
  @override
  late final GeneratedColumn<String> personUsername = GeneratedColumn<String>(
      'person_username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        datePost,
        person,
        parentPostId,
        imageProfileImage,
        personName,
        personUsername
      ];
  @override
  String get aliasedName => _alias ?? 'post';
  @override
  String get actualTableName => 'post';
  @override
  VerificationContext validateIntegrity(Insertable<PostData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date_post')) {
      context.handle(_datePostMeta,
          datePost.isAcceptableOrUnknown(data['date_post']!, _datePostMeta));
    } else if (isInserting) {
      context.missing(_datePostMeta);
    }
    if (data.containsKey('person')) {
      context.handle(_personMeta,
          person.isAcceptableOrUnknown(data['person']!, _personMeta));
    } else if (isInserting) {
      context.missing(_personMeta);
    }
    if (data.containsKey('parent_post_id')) {
      context.handle(
          _parentPostIdMeta,
          parentPostId.isAcceptableOrUnknown(
              data['parent_post_id']!, _parentPostIdMeta));
    }
    if (data.containsKey('image_profile_image')) {
      context.handle(
          _imageProfileImageMeta,
          imageProfileImage.isAcceptableOrUnknown(
              data['image_profile_image']!, _imageProfileImageMeta));
    } else if (isInserting) {
      context.missing(_imageProfileImageMeta);
    }
    if (data.containsKey('person_name')) {
      context.handle(
          _personNameMeta,
          personName.isAcceptableOrUnknown(
              data['person_name']!, _personNameMeta));
    } else if (isInserting) {
      context.missing(_personNameMeta);
    }
    if (data.containsKey('person_username')) {
      context.handle(
          _personUsernameMeta,
          personUsername.isAcceptableOrUnknown(
              data['person_username']!, _personUsernameMeta));
    } else if (isInserting) {
      context.missing(_personUsernameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PostData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      datePost: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_post'])!,
      person: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person'])!,
      parentPostId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_post_id']),
      imageProfileImage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}image_profile_image'])!,
      personName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}person_name'])!,
      personUsername: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}person_username'])!,
    );
  }

  @override
  $PostTable createAlias(String alias) {
    return $PostTable(attachedDatabase, alias);
  }
}

class ProfileData extends DataClass implements Insertable<ProfileData> {
  final int id;
  final String name;
  final String userName;
  final String email;
  final String password;
  final DateTime birthday;
  final String imagePersonUrl;
  const ProfileData(
      {required this.id,
      required this.name,
      required this.userName,
      required this.email,
      required this.password,
      required this.birthday,
      required this.imagePersonUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['user_name'] = Variable<String>(userName);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['birthday'] = Variable<DateTime>(birthday);
    map['image_person_url'] = Variable<String>(imagePersonUrl);
    return map;
  }

  ProfileCompanion toCompanion(bool nullToAbsent) {
    return ProfileCompanion(
      id: Value(id),
      name: Value(name),
      userName: Value(userName),
      email: Value(email),
      password: Value(password),
      birthday: Value(birthday),
      imagePersonUrl: Value(imagePersonUrl),
    );
  }

  factory ProfileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userName: serializer.fromJson<String>(json['userName']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      birthday: serializer.fromJson<DateTime>(json['birthday']),
      imagePersonUrl: serializer.fromJson<String>(json['imagePersonUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'userName': serializer.toJson<String>(userName),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'birthday': serializer.toJson<DateTime>(birthday),
      'imagePersonUrl': serializer.toJson<String>(imagePersonUrl),
    };
  }

  ProfileData copyWith(
          {int? id,
          String? name,
          String? userName,
          String? email,
          String? password,
          DateTime? birthday,
          String? imagePersonUrl}) =>
      ProfileData(
        id: id ?? this.id,
        name: name ?? this.name,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        birthday: birthday ?? this.birthday,
        imagePersonUrl: imagePersonUrl ?? this.imagePersonUrl,
      );
  @override
  String toString() {
    return (StringBuffer('ProfileData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('birthday: $birthday, ')
          ..write('imagePersonUrl: $imagePersonUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, userName, email, password, birthday, imagePersonUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileData &&
          other.id == this.id &&
          other.name == this.name &&
          other.userName == this.userName &&
          other.email == this.email &&
          other.password == this.password &&
          other.birthday == this.birthday &&
          other.imagePersonUrl == this.imagePersonUrl);
}

class ProfileCompanion extends UpdateCompanion<ProfileData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> userName;
  final Value<String> email;
  final Value<String> password;
  final Value<DateTime> birthday;
  final Value<String> imagePersonUrl;
  const ProfileCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userName = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.birthday = const Value.absent(),
    this.imagePersonUrl = const Value.absent(),
  });
  ProfileCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String userName,
    required String email,
    required String password,
    required DateTime birthday,
    required String imagePersonUrl,
  })  : name = Value(name),
        userName = Value(userName),
        email = Value(email),
        password = Value(password),
        birthday = Value(birthday),
        imagePersonUrl = Value(imagePersonUrl);
  static Insertable<ProfileData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? userName,
    Expression<String>? email,
    Expression<String>? password,
    Expression<DateTime>? birthday,
    Expression<String>? imagePersonUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userName != null) 'user_name': userName,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (birthday != null) 'birthday': birthday,
      if (imagePersonUrl != null) 'image_person_url': imagePersonUrl,
    });
  }

  ProfileCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? userName,
      Value<String>? email,
      Value<String>? password,
      Value<DateTime>? birthday,
      Value<String>? imagePersonUrl}) {
    return ProfileCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      birthday: birthday ?? this.birthday,
      imagePersonUrl: imagePersonUrl ?? this.imagePersonUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<DateTime>(birthday.value);
    }
    if (imagePersonUrl.present) {
      map['image_person_url'] = Variable<String>(imagePersonUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('birthday: $birthday, ')
          ..write('imagePersonUrl: $imagePersonUrl')
          ..write(')'))
        .toString();
  }
}

class $ProfileTable extends Profile with TableInfo<$ProfileTable, ProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfileTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _birthdayMeta =
      const VerificationMeta('birthday');
  @override
  late final GeneratedColumn<DateTime> birthday = GeneratedColumn<DateTime>(
      'birthday', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _imagePersonUrlMeta =
      const VerificationMeta('imagePersonUrl');
  @override
  late final GeneratedColumn<String> imagePersonUrl = GeneratedColumn<String>(
      'image_person_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, userName, email, password, birthday, imagePersonUrl];
  @override
  String get aliasedName => _alias ?? 'profile';
  @override
  String get actualTableName => 'profile';
  @override
  VerificationContext validateIntegrity(Insertable<ProfileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('birthday')) {
      context.handle(_birthdayMeta,
          birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta));
    } else if (isInserting) {
      context.missing(_birthdayMeta);
    }
    if (data.containsKey('image_person_url')) {
      context.handle(
          _imagePersonUrlMeta,
          imagePersonUrl.isAcceptableOrUnknown(
              data['image_person_url']!, _imagePersonUrlMeta));
    } else if (isInserting) {
      context.missing(_imagePersonUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      birthday: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birthday'])!,
      imagePersonUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}image_person_url'])!,
    );
  }

  @override
  $ProfileTable createAlias(String alias) {
    return $ProfileTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $PostTable post = $PostTable(this);
  late final $ProfileTable profile = $ProfileTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [post, profile];
}
