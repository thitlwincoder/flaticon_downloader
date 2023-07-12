library flaticon_downloader;

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

enum IconType { png, gif }

class FlatIconDownloader {
  // get single link
  static Future<String?> get(String url, {IconType type = IconType.png}) async {
    // parse uri
    var uri = Uri.tryParse(url);

    // if not uri throw exception
    if (uri == null) throw Exception('url is not uri');

    // get reponse from url
    var r = await http.get(Uri.parse(url));

    // parse html body
    var body = parse(r.body);

    // get detail
    var detail = body.querySelector('#detail');

    // check null
    if (detail == null) throw Exception('Invalid Url');

    String? data;

    // if [IconType.png] get png image
    if (type == IconType.png) {
      data = detail.attributes['data-png'];
    } else {
      // else get gif
      data = detail.attributes['data-gif'];
    }

    // return url
    return data;
  }

  // get multi link
  static Future<List<String>?> getMulti(String url) async {
    // get url
    var content = await get(url);

    // check null
    if (content == null) return null;

    // return list with mutliple quality
    return [
      content.replaceFirst('256', '512'),
      content,
      content.replaceFirst('256', '128'),
      content.replaceFirst('256', '64'),
      content.replaceFirst('256', '32'),
      content.replaceFirst('256', '24'),
      content.replaceFirst('256', '16'),
    ];
  }
}
