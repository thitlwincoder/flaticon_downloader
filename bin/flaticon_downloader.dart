import 'package:flaticon_downloader/flaticon_downloader.dart';

Future<void> main(List<String> arguments) async {
  const url =
      'https://www.flaticon.com/free-animated-icon/phone_6172514?related_id=6172514';

  final result = await FlatIconDownloader.get(url, type: IconType.gif);
  print(result);

  final multiResult = await FlatIconDownloader.getMulti(url);
  print(multiResult);
}
