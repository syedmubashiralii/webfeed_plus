import 'package:webfeed_plus/util/iterable.dart';
import 'package:xml/xml.dart';

class ItunesOwner {
  final String? name;
  final String? email;

  ItunesOwner({this.name, this.email});

  factory ItunesOwner.parse(XmlElement element) {
    return ItunesOwner(
      name: element.findElements('itunes:name').firstOrNull?.value?.trim(),
      email: element.findElements('itunes:email').firstOrNull?.value?.trim(),
    );
  }
}
