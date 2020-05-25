class CommonModel {
  String title;
  String type;
  String synopsis;
  int popularityRank;
  int ratingRank;
  String posterImage;
  String backgroundImage;
  String averageRating;
  String ageRating;
  String startDate;
  String endDate;
  String subType;
  String status;
  int episodeCount;
  int episodeLength;
  int totalLength;
  String showType;
  String youtubeId;
  String id;
  bool nsfw;

  CommonModel({
    this.title,
    this.type,
    this.synopsis,
    this.popularityRank,
    this.ratingRank,
    this.posterImage,
    this.backgroundImage,
    this.averageRating,
    this.ageRating,
    this.startDate,
    this.endDate,
    this.subType,
    this.status,
    this.episodeCount,
    this.episodeLength,
    this.totalLength,
    this.showType,
    this.youtubeId,
    this.id,
    this.nsfw,
  });

  factory CommonModel.fromJson(Map<String, dynamic> item) {
    CommonModel anime = CommonModel();            
    var att = item['attributes'];
    anime.id = item['id'] as String?? '';
    anime.type = item['type'] as String?? '';
    anime.synopsis=att['synopsis'] as String?? '';
    anime.popularityRank=att['popularityRank'] as int?? 0;
    anime.ratingRank=att['ratingRank'] as int?? 0;
    if(att['posterImage'] !=null && att['posterImage']['medium']!=null){
       anime.posterImage = att['posterImage']['medium'] as String;
    }else{
       anime.posterImage = '';
    }

    if(att['coverImage']!=null && att['coverImage']['large']!=null){
       anime.backgroundImage = att['coverImage']['large'] as String;
    }else{
       anime.backgroundImage = '';
    }
    anime.averageRating = att['averageRating'] as String?? '';
    anime.ageRating = att['ageRating'] as String?? '';
    anime.startDate = att['startDate'] as String?? '';
    anime.endDate = att['endDate'] as String?? '';
    anime.subType = att['subType'] as String?? '';
    anime.status = att['status'] as String?? '';
    anime.episodeCount = att['episodeCount'] as int?? 0;
    anime.episodeLength = att['episodeLength'] as int?? 0;
    anime.totalLength = att['totalLength'] as int?? 0;
    anime.showType = att['showType'] as String?? '';
    anime.youtubeId = att['youtubeId'] as String?? '';
    anime.title = att['titles']['en'] as String?? '';
    anime.nsfw = att['nsfw'] as bool?? true;

    return anime;
  }
}
