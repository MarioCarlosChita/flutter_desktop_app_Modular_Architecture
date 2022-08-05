
abstract class DatabaseException {
  final String message;
  DatabaseException({required this.message});
}

class DatabaseErrorException  extends  DatabaseException {
  DatabaseErrorException({required super.message});
}


class DatabaseColumnException extends  DatabaseException {
  DatabaseColumnException({required super.message});
}

class DatabaseTableException extends  DatabaseException{
  DatabaseTableException({required super.message});
}

class DatabaseQueryException extends DatabaseException {
  DatabaseQueryException({required super.message});
}

