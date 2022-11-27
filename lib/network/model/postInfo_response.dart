class PostInfoResponse {
  PostInfoResponse({
    required this.accountImage,
    required this.accountName,
    required this.timeLine,
    required this.images,
  });
  final String accountImage;
  final String accountName;
  final List<PostTimeLineInfo> timeLine;
  final List<String> images;

  static PostInfoResponse fromJson(Map<String, dynamic> json) {
    return PostInfoResponse(
      accountImage: json['account_image_path'],
      accountName: json['Account_name'],
      timeLine: [
        for(var line in json['time_lines'])
          PostTimeLineInfo(
            period: line['period'],
            event: line['event'],
        ),
      ],
      images: [
        ...json['images']
      ],
    );
  }
}

class PostTimeLineInfo {
  PostTimeLineInfo({
    required this.period,
    required this.event,
  });
  final String period;
  final String event;
}



