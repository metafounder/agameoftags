import 'package:agameoftags/module/tag/domain/usecase/tag_getall_usecase.dart';
import 'package:agameoftags/module/tag/repository/tag_remote_repository.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future setupIoC() async {
  registerRepositories();

  registerUseCases();

  registerViewModels();
}

void registerRepositories() {
  // Tag
  sl.registerLazySingleton(
    () => TagRemoteRepository(),
  );
  sl.registerLazySingleton<TagGetAllRepository>(
    () => sl.get<TagRemoteRepository>(),
  );
}

void registerUseCases() {
  // Tag
  sl.registerLazySingleton(
    () => TagGetAllUseCase(
      repository: sl(),
    ),
  );
}

void registerViewModels() {
  ///
}
