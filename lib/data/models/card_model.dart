import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel {
    @JsonKey(name: "data")
    final List<Datum>? data;
    @JsonKey(name: "pagination")
    final Pagination? pagination;

    CardModel({
        this.data,
        this.pagination,
    });

    factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);

    Map<String, dynamic> toJson() => _$CardModelToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "_id")
    final String? id;
    @JsonKey(name: "title")
    final String? title;
    @JsonKey(name: "category")
    final String? category;
    @JsonKey(name: "short_description")
    final String? shortDescription;
    @JsonKey(name: "image")
    final String? image;
    @JsonKey(name: "date")
    final String? date;

    Datum({
        this.id,
        this.title,
        this.category,
        this.shortDescription,
        this.image,
        this.date,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Pagination {
    @JsonKey(name: "total_records")
    final int? totalRecords;
    @JsonKey(name: "current_page")
    final int? currentPage;
    @JsonKey(name: "total_pages")
    final int? totalPages;
    @JsonKey(name: "next_page")
    final dynamic nextPage;
    @JsonKey(name: "prev_page")
    final dynamic prevPage;

    Pagination({
        this.totalRecords,
        this.currentPage,
        this.totalPages,
        this.nextPage,
        this.prevPage,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

    Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
