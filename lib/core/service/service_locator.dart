import 'package:get_it/get_it.dart';
import 'package:movies_appp/features/movies/data/data_source/remote_data_source.dart';
import 'package:movies_appp/features/movies/data/repositery/get_movies_data_repositery_now_plying.dart';
import 'package:movies_appp/features/movies/domine/repositery/movies_repo.dart';
import 'package:movies_appp/features/movies/domine/usecase/get_movies_now_plying_use_case.dart';
import 'package:movies_appp/features/movies/presentation/controller/cubit.dart'; // Assuming this is where your repository is

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///Remote data source
    sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

    ///Repository

    sl.registerLazySingleton<MovieRepository>(() => RepositoryImpl(sl()));

    ///Use case

    sl.registerLazySingleton(() => GetMoviesNowPlyingUseCase(sl()));

    ///Bloc
    sl.registerFactory(()=>MovieBloc(sl()));

  }
}
