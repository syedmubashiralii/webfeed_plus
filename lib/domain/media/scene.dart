import 'package:webfeed_plus/util/iterable.dart';
import 'package:xml/xml.dart';

class Scene {
  final String? title;
  final String? description;
  final String? startTime;
  final String? endTime;

  Scene({
    this.title,
    this.description,
    this.startTime,
    this.endTime,
  });

  factory Scene.parse(XmlElement element) {
    return Scene(
      title: element.findElements('sceneTitle').firstOrNull?.value,
      description: element.findElements('sceneDescription').firstOrNull?.value,
      startTime: element.findElements('sceneStartTime').firstOrNull?.value,
      endTime: element.findElements('sceneEndTime').firstOrNull?.value,
    );
  }
}
