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

  static List<PostInfoResponse>? fromJson(List<dynamic> json) {
    List<PostInfoResponse> response = [];
    for(var data in json){
      response.add(
        PostInfoResponse(
          accountImage: data['account_image_path'],
          accountName: data['account_name'],
          timeLine: [
            for(var line in data['time_lines'])
              PostTimeLineInfo(
                period: line['period'],
                event: line['event'],
            ),
          ],
          images: [
            ...data['images']
          ],
        )
      );
    }

    return response;
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



