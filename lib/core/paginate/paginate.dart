enum PaginateKeys { starthashkey, startpartkey, startsortkey, sortasc }

extension Stringify on PaginateKeys {
  String stringify() {
    switch (this) {
      case PaginateKeys.starthashkey:
        return 'starthashkey';
      case PaginateKeys.startpartkey:
        return 'startpartkey';
      case PaginateKeys.startsortkey:
        return 'startsortkey';
      case PaginateKeys.sortasc:
        return 'sortasc';
      default:
        return '';
    }
  }
}

class Paginate {
  Map<String, String> nextKeys;
  bool sortAsc;

  Paginate({
    required this.nextKeys,
    required this.sortAsc,
  });
}

class CustomResponse {
  dynamic data;
  Paginate? nextPage;

  CustomResponse({
    required this.data,
    this.nextPage,
  }) {
    data = data;
    nextPage = nextPage;
  }
}
