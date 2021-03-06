// Copyright (c) 2017, Matthew Barbour. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:version/version.dart';
import 'package:test/test.dart';

void main() {
  Version zeroZeroOne,
      zeroOneZero,
      oneZeroZero,
      fiveZeroFive,
      oneZeroZeroDuplicate,
      buildVersion,
      preReleaseVersion,
      buildAndPrereleaseVersion;

  setUp(() {
    zeroZeroOne = new Version(0, 0, 1);
    zeroOneZero = new Version(0, 1, 0);
    oneZeroZero = new Version(1, 0, 0);

    fiveZeroFive = new Version(5, 0, 5);
    oneZeroZeroDuplicate = new Version(1, 0, 0);

    buildVersion = new Version(1, 0, 0, build: "buildNumber");
    preReleaseVersion = new Version(1, 0, 0, preRelease: ["alpha"]);
    buildAndPrereleaseVersion =
        new Version(1, 0, 0, preRelease: ["alpha"], build: "anotherBuild");
  });

  test('== tests', () {
    expect(zeroZeroOne == zeroOneZero, isFalse);
    expect(zeroZeroOne == oneZeroZero, isFalse);
    expect(zeroOneZero == oneZeroZero, isFalse);
    expect(fiveZeroFive == zeroOneZero, isFalse);

    expect(zeroZeroOne == zeroZeroOne, isTrue);
    expect(zeroOneZero == zeroOneZero, isTrue);
    expect(oneZeroZero == oneZeroZero, isTrue);
    expect(fiveZeroFive == fiveZeroFive, isTrue);
    expect(oneZeroZero == oneZeroZeroDuplicate, isTrue);

    expect(buildVersion == oneZeroZero, isTrue);
    expect(preReleaseVersion == oneZeroZero, isFalse);
    expect(buildVersion == buildVersion, isTrue);
    expect(preReleaseVersion == preReleaseVersion, isTrue);

    expect(buildAndPrereleaseVersion == preReleaseVersion, isTrue);
    expect(buildAndPrereleaseVersion == buildVersion, isFalse);
    expect(buildAndPrereleaseVersion == oneZeroZero, isFalse);
    expect(buildAndPrereleaseVersion == buildAndPrereleaseVersion, isTrue);
  });

  test('> tests', () {
    expect(zeroZeroOne > zeroOneZero, isFalse);
    expect(zeroZeroOne > oneZeroZero, isFalse);
    expect(zeroOneZero > oneZeroZero, isFalse);
    expect(zeroOneZero > fiveZeroFive, isFalse);

    expect(zeroOneZero > zeroZeroOne, isTrue);
    expect(oneZeroZero > zeroZeroOne, isTrue);
    expect(oneZeroZero > zeroOneZero, isTrue);
    expect(fiveZeroFive > zeroOneZero, isTrue);

    expect(zeroZeroOne > zeroZeroOne, isFalse);
    expect(zeroOneZero > zeroOneZero, isFalse);
    expect(oneZeroZero > oneZeroZero, isFalse);
    expect(fiveZeroFive > fiveZeroFive, isFalse);
    expect(oneZeroZero > oneZeroZeroDuplicate, isFalse);

    expect(buildVersion > oneZeroZero, isFalse);
    expect(oneZeroZero > buildVersion, isFalse);

    expect(preReleaseVersion > oneZeroZero, isFalse);
    expect(oneZeroZero > preReleaseVersion, isTrue);

    expect(buildVersion > buildVersion, isFalse);
    expect(preReleaseVersion > preReleaseVersion, isFalse);

    expect(buildAndPrereleaseVersion > preReleaseVersion, isFalse);
    expect(preReleaseVersion > buildAndPrereleaseVersion, isFalse);

    expect(buildAndPrereleaseVersion > buildVersion, isFalse);
    expect(buildVersion > buildAndPrereleaseVersion, isTrue);

    expect(buildAndPrereleaseVersion > oneZeroZero, isFalse);
    expect(oneZeroZero > buildAndPrereleaseVersion, isTrue);

    expect(buildAndPrereleaseVersion > buildAndPrereleaseVersion, isFalse);
  });

  test('< tests', () {
    expect(zeroZeroOne < zeroOneZero, isTrue);
    expect(zeroZeroOne < oneZeroZero, isTrue);
    expect(zeroOneZero < oneZeroZero, isTrue);
    expect(zeroOneZero < fiveZeroFive, isTrue);

    expect(zeroOneZero < zeroZeroOne, isFalse);
    expect(oneZeroZero < zeroZeroOne, isFalse);
    expect(oneZeroZero < zeroOneZero, isFalse);
    expect(fiveZeroFive < zeroOneZero, isFalse);

    expect(zeroZeroOne < zeroZeroOne, isFalse);
    expect(zeroOneZero < zeroOneZero, isFalse);
    expect(oneZeroZero < oneZeroZero, isFalse);
    expect(fiveZeroFive < fiveZeroFive, isFalse);
    expect(oneZeroZero < oneZeroZeroDuplicate, isFalse);

    expect(buildVersion < oneZeroZero, isFalse);
    expect(oneZeroZero < buildVersion, isFalse);

    expect(preReleaseVersion < oneZeroZero, isTrue);
    expect(oneZeroZero < preReleaseVersion, isFalse);

    expect(buildVersion < buildVersion, isFalse);
    expect(preReleaseVersion < preReleaseVersion, isFalse);

    expect(buildAndPrereleaseVersion < preReleaseVersion, isFalse);
    expect(preReleaseVersion < buildAndPrereleaseVersion, isFalse);
    expect(buildAndPrereleaseVersion < buildVersion, isTrue);
    expect(buildVersion < buildAndPrereleaseVersion, isFalse);
    expect(buildAndPrereleaseVersion < oneZeroZero, isTrue);
    expect(oneZeroZero < buildAndPrereleaseVersion, isFalse);
    expect(buildAndPrereleaseVersion < buildAndPrereleaseVersion, isFalse);
  });

  test('<= tests', () {
    expect(zeroZeroOne <= zeroOneZero, isTrue);
    expect(zeroZeroOne <= oneZeroZero, isTrue);
    expect(zeroOneZero <= oneZeroZero, isTrue);
    expect(zeroOneZero <= fiveZeroFive, isTrue);

    expect(zeroOneZero <= zeroZeroOne, isFalse);
    expect(oneZeroZero <= zeroZeroOne, isFalse);
    expect(oneZeroZero <= zeroOneZero, isFalse);
    expect(fiveZeroFive <= zeroOneZero, isFalse);

    expect(zeroZeroOne <= zeroZeroOne, isTrue);
    expect(zeroOneZero <= zeroOneZero, isTrue);
    expect(oneZeroZero <= oneZeroZero, isTrue);
    expect(fiveZeroFive <= fiveZeroFive, isTrue);
    expect(oneZeroZero <= oneZeroZeroDuplicate, isTrue);

    expect(buildVersion <= oneZeroZero, isTrue);
    expect(oneZeroZero <= buildVersion, isTrue);

    expect(preReleaseVersion <= oneZeroZero, isTrue);
    expect(oneZeroZero <= preReleaseVersion, isFalse);

    expect(buildVersion <= buildVersion, isTrue);
    expect(preReleaseVersion <= preReleaseVersion, isTrue);

    expect(buildAndPrereleaseVersion <= preReleaseVersion, isTrue);
    expect(preReleaseVersion <= buildAndPrereleaseVersion, isTrue);
    expect(buildAndPrereleaseVersion <= buildVersion, isTrue);
    expect(buildVersion <= buildAndPrereleaseVersion, isFalse);
    expect(buildAndPrereleaseVersion <= oneZeroZero, isTrue);
    expect(oneZeroZero <= buildAndPrereleaseVersion, isFalse);
    expect(buildAndPrereleaseVersion <= buildAndPrereleaseVersion, isTrue);
  });

  test('>= tests', () {
    expect(zeroZeroOne >= zeroOneZero, isFalse);
    expect(zeroZeroOne >= oneZeroZero, isFalse);
    expect(zeroOneZero >= oneZeroZero, isFalse);
    expect(zeroOneZero >= fiveZeroFive, isFalse);

    expect(zeroOneZero >= zeroZeroOne, isTrue);
    expect(oneZeroZero >= zeroZeroOne, isTrue);
    expect(oneZeroZero >= zeroOneZero, isTrue);
    expect(fiveZeroFive >= zeroOneZero, isTrue);

    expect(zeroZeroOne >= zeroZeroOne, isTrue);
    expect(zeroOneZero >= zeroOneZero, isTrue);
    expect(oneZeroZero >= oneZeroZero, isTrue);
    expect(fiveZeroFive >= fiveZeroFive, isTrue);
    expect(oneZeroZero >= oneZeroZeroDuplicate, isTrue);

    expect(buildVersion >= oneZeroZero, isTrue);
    expect(oneZeroZero >= buildVersion, isTrue);

    expect(preReleaseVersion >= oneZeroZero, isFalse);
    expect(oneZeroZero >= preReleaseVersion, isTrue);

    expect(buildVersion >= buildVersion, isTrue);
    expect(preReleaseVersion >= preReleaseVersion, isTrue);

    expect(buildAndPrereleaseVersion >= preReleaseVersion, isTrue);
    expect(preReleaseVersion >= buildAndPrereleaseVersion, isTrue);

    expect(buildAndPrereleaseVersion >= buildVersion, isFalse);
    expect(buildVersion >= buildAndPrereleaseVersion, isTrue);

    expect(buildAndPrereleaseVersion >= oneZeroZero, isFalse);
    expect(oneZeroZero >= buildAndPrereleaseVersion, isTrue);

    expect(buildAndPrereleaseVersion >= buildAndPrereleaseVersion, isTrue);
  });

  test("Validation tests", () {
    expect(() => new Version(null, 0, 0), throwsArgumentError);
    expect(() => new Version(1, null, 0), throwsArgumentError);
    expect(() => new Version(1, 2, null), throwsArgumentError);
    expect(() => new Version(-1, 0, 0), throwsArgumentError);
    expect(() => new Version(1, -1, 0), throwsArgumentError);
    expect(() => new Version(1, 1, -1), throwsArgumentError);
    expect(() => new Version(0, 0, 0), throwsArgumentError);
    expect(() => new Version(1, 0, 0, build: null), throwsArgumentError);
    expect(() => new Version(1, 0, 0, preRelease: null), throwsArgumentError);
    expect(() => new Version(1, 0, 0, preRelease: [null]), throwsArgumentError);
    expect(() => new Version(1, 0, 0, preRelease: [""]), throwsArgumentError);
    expect(() => new Version(1, 0, 0, preRelease: ["not^safe"]),
        throwsFormatException);
    expect(
        () => new Version(1, 0, 0, build: "not^safe"), throwsFormatException);
  });

  test("Parse tests", () {
    expect(Version.parse("1"), equals(new Version(1, 0, 0)));
    expect(Version.parse("1.0"), equals(new Version(1, 0, 0)));
    expect(Version.parse("1.2.1"), equals(new Version(1, 2, 1)));
    expect(Version.parse("0.5.3"), equals(new Version(0, 5, 3)));
    expect(Version.parse("1.2.3.5"), equals(new Version(1, 2, 3)));
    expect(Version.parse("99999.55465.5456"),
        equals(new Version(99999, 55465, 5456)));
    expect(Version.parse("1.0.0-alpha"),
        equals(new Version(1, 0, 0, preRelease: <String>["alpha"])));
    expect(Version.parse("1.0.0+build"),
        equals(new Version(1, 0, 0, build: "build")));
    expect(
        Version.parse("1.0.0-alpha+build"),
        equals(new Version(1, 0, 0,
            build: "build", preRelease: <String>["alpha"])));
    expect(
        Version.parse("1.0.0-alpha.beta+build"),
        equals(new Version(1, 0, 0,
            build: "build", preRelease: <String>["alpha", "beta"])));

    expect(
        Version.parse("1.0.0-az.AZ.12-3+az.AZ.12-3"),
        equals(new Version(1, 0, 0,
            build: "az.AZ.12-3", preRelease: <String>["az", "AZ", "12-3"])));

    expect(() => Version.parse("a"), throwsFormatException);
    expect(() => Version.parse("123,4322"), throwsFormatException);
    expect(() => Version.parse("123a"), throwsFormatException);
    expect(() => Version.parse("1.0.0+not^safe"), throwsFormatException);
    expect(() => Version.parse("1.0.0-not^safe"), throwsFormatException);
  });

  test("Increment tests", () {
    expect(new Version(1, 0, 0).incrementMajor(), equals(new Version(2, 0, 0)));
    expect(new Version(1, 1, 0).incrementMajor(), equals(new Version(2, 0, 0)));
    expect(new Version(1, 1, 1).incrementMajor(), equals(new Version(2, 0, 0)));
    expect(new Version(1, 0, 0).incrementMinor(), equals(new Version(1, 1, 0)));
    expect(new Version(1, 1, 2).incrementMinor(), equals(new Version(1, 2, 0)));
    expect(new Version(1, 0, 0).incrementPatch(), equals(new Version(1, 0, 1)));
    expect(new Version(1, 1, 2).incrementPatch(), equals(new Version(1, 1, 3)));

    expect(
        new Version(1, 1, 1, preRelease: ["alpha"], build: "test")
            .incrementMajor(),
        equals(new Version(2, 0, 0)));
  });

  test("toString tests", () {
    expect(new Version(1, 0, 0).toString(), equals("1.0.0"));
    expect(new Version(1, 1, 0).toString(), equals("1.1.0"));
    expect(new Version(1, 1, 1).toString(), equals("1.1.1"));
    expect(new Version(1, 0, 1).toString(), equals("1.0.1"));
    expect(new Version(001, 000, 0010).toString(), equals("1.0.10"));
    expect(
        new Version(1, 1, 1, build: "alpha").toString(), equals("1.1.1+alpha"));
    expect(new Version(1, 1, 1, preRelease: ["alpha", "omega"]).toString(),
        equals("1.1.1-alpha.omega"));
    expect(
        new Version(1, 1, 1, build: "alpha", preRelease: ["beta", "gamma"])
            .toString(),
        equals("1.1.1-beta.gamma+alpha"));
  });

  test("Pre-release precedence test", () {
    // TODO: Implement 1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-alpha.beta < 1.0.0-beta < 1.0.0-beta.2 < 1.0.0-beta.11 < 1.0.0-rc.1 < 1.0.0
    final Version a = Version.parse("1.0.0-alpha");
    final Version b = Version.parse("1.0.0-alpha.1");
    final Version c = Version.parse("1.0.0-alpha.beta");
    final Version d = Version.parse("1.0.0-beta");
    final Version e = Version.parse("1.0.0-beta.2");
    final Version f = Version.parse("1.0.0-beta.11");
    final Version g = Version.parse("1.0.0-rc.1");
    final Version h = Version.parse("1.0.0");

    expect(a < b, isTrue);
    expect(b < c, isTrue);
    expect(c < d, isTrue);
    expect(d < e, isTrue);
    expect(e < f, isTrue);
    expect(f < g, isTrue);
    expect(g < h, isTrue);

    expect(a > b, isFalse);
    expect(b > c, isFalse);
    expect(c > d, isFalse);
    expect(d > e, isFalse);
    expect(e > f, isFalse);
    expect(f > g, isFalse);
    expect(g > h, isFalse);
  });
}
