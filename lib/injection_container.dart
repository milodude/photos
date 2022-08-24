import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/providers/url_provider.dart';
import 'features/landing_page/data/data_source/photo_data_source.dart';
import 'features/landing_page/data/repository/photo_repository_impl.dart';
import 'features/landing_page/domain/repository/photo_repository.dart';
import 'features/landing_page/domain/use_cases/get_photo_use_case.dart';
import 'features/landing_page/presentation/bloc/photo/photo_bloc.dart';
import 'features/photo_details/data/repository/photo_details_repository_impl.dart';
import 'features/photo_details/domain/repository/photo_details_repository.dart';
import 'features/photo_details/domain/use_cases/get_photo_details_use_case.dart';
import 'features/photo_details/presentation/bloc/photo_details/photo_details_bloc.dart';

final GetIt sl = GetIt.instance;
//LazySingletons se crean cuando se requiere
//Singletons se crea una sola  instancia
//factory se crea cada vez  que se necesita una instancia
Future<void> init() async {
  //! Features
  // Bloc - No tienen que ser singletons por que estan muy cerca de la parte de la UI, por ejemplo puede abrir y volver a la
  // pagina anterior. Si llegamos a a hacer un dispose puede que hayamos eliminado ese singleton y va a traernos un error.
  sl.registerFactory(() => PhotoBloc(getPhotoUseCase: sl()));
  sl.registerFactory(() => PhotoDetailsBloc(getPhotoDetailsUseCase: sl()));

  // sl.registerFactory(() => SingleClientBloc(addClientUseCase: sl()));

  //Al no mantener estados en el caso de uso, no es necesario tener una factoria
  //!Use Cases
  sl.registerLazySingleton<GetPhotoUseCase>(
      () => GetPhotoUseCase(photoRepository: sl()));
  sl.registerLazySingleton<GetPhotoDetailsUseCase>(
      () => GetPhotoDetailsUseCase(photoDetailsRepository: sl()));
  //!Repository
  sl.registerLazySingleton<PhotoRepository>(
      () => PhotoRepositoryImpl(photoDataSource: sl()));
  sl.registerLazySingleton<PhotoDetailsRepository>(
      () => PhotoDetailsRepositoryImpl(photoDataSource: sl()));

  //!Data Sources
  sl.registerLazySingleton<PhotoDataSource>(
      () => PhotoDataSource(httpClient: sl(), urlProvider: sl()));

  //! Core
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => UrlProvider());
  //! External
}
