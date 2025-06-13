import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

/// Represents the types of icons supported by the downloader.
///
/// - [png]: Portable Network Graphics format.
/// - [gif]: Graphics Interchange Format.
enum IconType {
  /// Portable Network Graphics format.
  png,

  /// Graphics Interchange Format.
  gif,
}

/// A utility class for downloading icons from the Flaticon service.
///
/// Provides methods and properties to facilitate the process of fetching,
/// downloading, and managing icon assets from Flaticon.
///
/// Example usage:
///
/// ```dart
/// final downloader = FlatIconDownloader();
/// // Use downloader to fetch and download icons.
/// ```
class FlatIconDownloader {
  /// Downloads an icon from the specified [url] and
  /// returns the local file path as a [String].
  ///
  /// The [type] parameter specifies the icon format to download,
  /// defaulting to [IconType.png].
  ///
  /// Returns a [Future] that completes with
  /// the local file path of the downloaded icon,
  /// or `null` if the download fails.
  static Future<String?> get(String url, {IconType type = IconType.png}) async {
    /// Attempts to parse the given [url] string into a [Uri] object.
    ///
    /// Returns a [Uri] if the parsing is successful,
    /// or `null` if the [url] is not a valid URI.
    ///
    /// See also:
    /// - [Uri.tryParse]
    final uri = Uri.tryParse(url);

    /// Throws an [Exception] if [uri] is `null`,
    /// indicating that the provided URL could not be parsed as a URI.
    if (uri == null) throw Exception('url is not uri');

    /// Sends an HTTP GET request to the specified [url]
    /// and stores the response in [r].
    ///
    /// Uses the `http` package to perform the network request asynchronously.
    ///
    /// Throws an exception if the request fails.
    final r = await http.get(Uri.parse(url));

    /// Parses the response body using the `parse` function
    /// and assigns the result to `body`.
    ///
    /// Assumes that `r.body` contains the raw response data to be parsed.
    /// The specific format and purpose of the parsed data
    /// depends on the implementation of `parse`.
    final body = parse(r.body);

    /// Selects the HTML element with the ID 'detail' from the parsed HTML body.
    ///
    /// This is typically used to extract a
    /// specific section of the HTML document,
    /// such as a detail panel or information block, for further processing.
    ///
    /// Returns `null` if no element with the specified ID is found.
    final detail = body.querySelector('#detail');

    /// Throws an [Exception] with the message 'Invalid Url'
    /// if [detail] is `null`.
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

  /// Fetches multiple items from the given [url] and returns a [Future] that
  /// completes with a list of strings, or `null` if the operation fails.
  ///
  static Future<List<String>?> getMulti(String url) async {
    // get url
    final content = await get(url);

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
