import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_delik_buyutme/oyun_delik_buyutme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(delikConfig.title.length, 33);
    expect(delikConfig.tagline.length, 33);
    for (final s in delikConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(delikRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: delikId, optionalMechanics: delikRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(delikRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
