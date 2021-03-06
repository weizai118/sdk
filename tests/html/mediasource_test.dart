library mediasource_test;

import 'package:unittest/unittest.dart';
import 'package:unittest/html_individual_config.dart';
import 'dart:html';
import 'dart:typed_data';
import 'dart:async';

main() {
  useHtmlIndividualConfiguration();

  var isMediaSource = predicate((x) => x is MediaSource, 'is a MediaSource');

  group('supported', () {
    test('supported', () {
      expect(MediaSource.supported, true);
    });
  });

  // TODO(alanknight): Actually exercise this, right now the tests are trivial.
  group('functional', () {
    var source;
    if (MediaSource.supported) {
      source = new MediaSource();
    }

    test('constructorTest', () {
      if (MediaSource.supported) {
        expect(source, isNotNull);
        expect(source, isMediaSource);
      }
    });

    test('media types', () {
      if (MediaSource.supported) {
        expect(MediaSource.isTypeSupported('text/html'), false);
        expect(MediaSource.isTypeSupported('video/webm;codecs="vp8,vorbis"'),
            true);
      }
    });
  });
}
