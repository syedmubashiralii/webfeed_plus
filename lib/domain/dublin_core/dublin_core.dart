import 'package:webfeed_plus/util/datetime.dart';
import 'package:webfeed_plus/util/iterable.dart';
import 'package:xml/xml.dart';

class DublinCore {
  final String? title;
  final String? description;
  final String? creator;
  final String? subject;
  final String? publisher;
  final String? contributor;
  final DateTime? date;
  final DateTime? created;
  final DateTime? modified;
  final String? type;
  final String? format;
  final String? identifier;
  final String? source;
  final String? language;
  final String? relation;
  final String? coverage;
  final String? rights;

  DublinCore({
    this.title,
    this.description,
    this.creator,
    this.subject,
    this.publisher,
    this.contributor,
    this.date,
    this.created,
    this.modified,
    this.type,
    this.format,
    this.identifier,
    this.source,
    this.language,
    this.relation,
    this.coverage,
    this.rights,
  });

  factory DublinCore.parse(XmlElement element) {
    return DublinCore(
      title: element.findElements('dc:title').firstOrNull?.value,
      description: element.findElements('dc:description').firstOrNull?.value,
      creator: element.findElements('dc:creator').firstOrNull?.value,
      subject: element.findElements('dc:subject').firstOrNull?.value,
      publisher: element.findElements('dc:publisher').firstOrNull?.value,
      contributor: element.findElements('dc:contributor').firstOrNull?.value,
      date: parseDateTime(element.findElements('dc:date').firstOrNull?.value),
      created:
          parseDateTime(element.findElements('dc:created').firstOrNull?.value),
      modified:
          parseDateTime(element.findElements('dc:modified').firstOrNull?.value),
      type: element.findElements('dc:type').firstOrNull?.value,
      format: element.findElements('dc:format').firstOrNull?.value,
      identifier: element.findElements('dc:identifier').firstOrNull?.value,
      source: element.findElements('dc:source').firstOrNull?.value,
      language: element.findElements('dc:language').firstOrNull?.value,
      relation: element.findElements('dc:relation').firstOrNull?.value,
      coverage: element.findElements('dc:coverage').firstOrNull?.value,
      rights: element.findElements('dc:rights').firstOrNull?.value,
    );
  }
}
