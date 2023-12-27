import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;