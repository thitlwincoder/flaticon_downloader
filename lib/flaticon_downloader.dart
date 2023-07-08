library flaticon_downloader;

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class FlatIconDownloader {
  // get single link
  static Future<String?> get(String url) async {
    // parse uri
    var uri = Uri.tryParse(url);

    // if not uri throw exception
    if (uri == null) throw Exception('url is not uri');

    // get reponse from url
    var r = await http.get(Uri.parse(url));

    // parse html body
    var body = parse(r.body);

    // get image from meta
    var meta = body.querySelector('meta[property="og:image"]');

    // return url from content
    return meta?.attributes['content'];
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
