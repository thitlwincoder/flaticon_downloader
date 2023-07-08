import 'package:flaticon_downloader/flaticon_downloader.dart';

Future<void> main(List<String> arguments) async {
  var url =
      'https://www.flaticon.com/free-sticker/santa-claus_4193253?related_id=4193253';

  var result = await FlatIconDownloader.get(url);
  print(result);

  var multiResult = await FlatIconDownloader.getMulti(url);
  print(multiResult);
}
