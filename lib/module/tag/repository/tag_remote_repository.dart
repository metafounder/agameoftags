import 'dart:convert';

import 'package:agameoftags/core/failure/failure.dart';
import 'package:agameoftags/core/paginate/paginate.dart';
import 'package:agameoftags/module/tag/domain/model/tag_model.dart';
import 'package:agameoftags/module/tag/domain/usecase/tag_getall_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;

class TagRemoteRepository implements TagGetAllRepository {
  @override
  Future<Either<Failure, TagsPaginatedModel>> getAll({
    required String accountId,
    Paginate? currentPage,
  }) async {
    return rootBundle.loadString('assets/mock_tags.json').then((value) {
      List<TagModel> responseData;
      try {
        final decoded = json.decode(value);

        final List<dynamic> result = decoded as List<dynamic>;
        responseData = result
            .map((e) => TagModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } catch (e) {
        return Left(
          ServerFailure('cannot get all tags by accountId: $e'),
        );
      }

      return Right(
        TagsPaginatedModel(data: responseData),
      );
    });
  }
}
