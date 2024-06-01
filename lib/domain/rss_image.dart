import 'package:webfeed_plus/util/iterable.dart';
import 'package:xml/xml.dart';

class RssImage {
  final String? title;
  final String? url;
  final String? link;

  RssImage({this.title, this.url, this.link});

  factory RssImage.parse(XmlElement element) {
    return RssImage(
      title: element.findElements('title').firstOrNull?.value,
      url: element.findElements('url').firstOrNull?.value,
      link: element.findElements('link').firstOrNull?.value,
    );
  }
}
