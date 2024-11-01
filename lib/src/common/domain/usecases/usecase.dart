abstract class Usecase {
  const Usecase();
}

abstract class UsecaseWithParams<T, Params extends UsecaseParams> extends Usecase {
  const UsecaseWithParams();
  
  Future<T> call(Params params);
}

abstract class UsecaseWithoutParams<T> extends Usecase {
  const UsecaseWithoutParams();
  
  Future<T> call();
}

abstract class UsecaseParams {
  const UsecaseParams();
}