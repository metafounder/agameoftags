import 'package:agameoftags/core/failure/failure.dart';
import 'package:agameoftags/core/paginate/paginate.dart';
import 'package:agameoftags/core/usecase/usecase.dart';
import 'package:agameoftags/module/tag/domain/model/tag_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class TagGetAllRepository {
  Future<Either<Failure, TagsPaginatedModel>> getAll({
    required String accountId,
    Paginate? currentPage,
  });
}

class TagGetAllUseCase implements UseCase<TagsPaginatedModel, TagGetAllParams> {
  final TagGetAllRepository repository;

  TagGetAllUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, TagsPaginatedModel>> call(TagGetAllParams params) {
    return repository.getAll(
      accountId: params.accountId,
      currentPage: params.currentPage,
    );
  }
}

class TagGetAllParams extends Equatable {
  final String accountId;
  final Paginate? currentPage;

  const TagGetAllParams({
    required this.accountId,
    this.currentPage,
  });

  @override
  List<Object> get props => [accountId];
}
