import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:flutter_highlight/themes/agate.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_highlight/themes/dark.dart';
import 'package:flutter_highlight/themes/default.dart';
import 'package:flutter_highlight/themes/docco.dart';
import 'package:flutter_highlight/themes/github-gist.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/googlecode.dart';
import 'package:flutter_highlight/themes/idea.dart';
import 'package:flutter_highlight/themes/mono-blue.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/monokai.dart';
import 'package:flutter_highlight/themes/obsidian.dart';
import 'package:flutter_highlight/themes/solarized-dark.dart';
import 'package:flutter_highlight/themes/solarized-light.dart';
import 'package:flutter_highlight/themes/tomorrow-night-blue.dart';
import 'package:flutter_highlight/themes/tomorrow-night-bright.dart';
import 'package:flutter_highlight/themes/tomorrow-night-eighties.dart';
import 'package:flutter_highlight/themes/tomorrow-night.dart';
import 'package:flutter_highlight/themes/paraiso-dark.dart';
import 'package:flutter_highlight/themes/paraiso-light.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_highlight/themes/xcode.dart';
import 'package:flutter_highlight/themes/atelier-dune-dark.dart';
import 'package:flutter_highlight/themes/atelier-dune-light.dart';
import 'package:flutter_highlight/themes/atelier-estuary-dark.dart';
import 'package:flutter_highlight/themes/atelier-estuary-light.dart';
import 'package:flutter_highlight/themes/atelier-forest-dark.dart';
import 'package:flutter_highlight/themes/atelier-forest-light.dart';
import 'package:flutter_highlight/themes/atelier-heath-dark.dart';
import 'package:flutter_highlight/themes/atelier-heath-light.dart';
import 'package:flutter_highlight/themes/atelier-lakeside-dark.dart';
import 'package:flutter_highlight/themes/atelier-lakeside-light.dart';
import 'package:flutter_highlight/themes/atelier-plateau-dark.dart';
import 'package:flutter_highlight/themes/atelier-plateau-light.dart';
import 'package:flutter_highlight/themes/atelier-savanna-dark.dart';
import 'package:flutter_highlight/themes/atelier-savanna-light.dart';
import 'package:flutter_highlight/themes/atelier-seaside-dark.dart';
import 'package:flutter_highlight/themes/atelier-seaside-light.dart';
import 'package:flutter_highlight/themes/atelier-sulphurpool-dark.dart';
import 'package:flutter_highlight/themes/atelier-sulphurpool-light.dart';
import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_highlight/themes/brown-paper.dart';
import 'package:flutter_highlight/themes/codepen-embed.dart';
import 'package:flutter_highlight/themes/color-brewer.dart';
import 'package:flutter/material.dart';

const samMarkdownThemes = [
  SamMarkdownThemes(theme: samTheme, themeName: "samTheme"),
  SamMarkdownThemes(theme: a11yLightTheme, themeName: "a11yLightTheme"),
  SamMarkdownThemes(theme: a11yDarkTheme, themeName: "a11yDarkTheme"),
  SamMarkdownThemes(theme: draculaTheme, themeName: "draculaTheme"),
  SamMarkdownThemes(theme: githubTheme, themeName: "githubTheme"),
  SamMarkdownThemes(theme: atomOneLightTheme, themeName: "atomOneLightTheme"),
  SamMarkdownThemes(theme: atomOneDarkReasonableTheme, themeName: "atomOneDarkReasonableTheme"),
  SamMarkdownThemes(theme: vsTheme, themeName: "vsTheme"),
  SamMarkdownThemes(theme: androidstudioTheme, themeName: "androidstudioTheme"),
  SamMarkdownThemes(theme: googlecodeTheme, themeName: "googlecodeTheme"),
  SamMarkdownThemes(theme: githubGistTheme, themeName: "githubGistTheme"),
  SamMarkdownThemes(theme: xcodeTheme, themeName: "xcodeTheme"),
  SamMarkdownThemes(theme: tomorrowNightBlueTheme, themeName: "tomorrowNightBlueTheme"),
  SamMarkdownThemes(theme: tomorrowNightBrightTheme, themeName: "tomorrowNightBrightTheme"),
  SamMarkdownThemes(theme: tomorrowNightEightiesTheme, themeName: "tomorrowNightEightiesTheme"),
  SamMarkdownThemes(theme: tomorrowNightTheme, themeName: "tomorrowNightTheme"),
  SamMarkdownThemes(theme: solarizedDarkTheme, themeName: "solarizedDarkTheme"),
  SamMarkdownThemes(theme: solarizedLightTheme, themeName: "solarizedLightTheme"),
  SamMarkdownThemes(theme: obsidianTheme, themeName: "obsidianTheme"),
  SamMarkdownThemes(theme: defaultTheme, themeName: "defaultTheme"),
  SamMarkdownThemes(theme: darkTheme, themeName: "darkTheme"),
  SamMarkdownThemes(theme: brownPaperTheme, themeName: "brownPaperTheme"),
  SamMarkdownThemes(theme: codepenEmbedTheme, themeName: "codepenEmbedTheme"),
  SamMarkdownThemes(theme: colorBrewerTheme, themeName: "colorBrewerTheme"),
  SamMarkdownThemes(theme: agateTheme, themeName: "agateTheme"),
  SamMarkdownThemes(theme: doccoTheme, themeName: "doccoTheme"),
  SamMarkdownThemes(theme: paraisoDarkTheme, themeName: "paraisoDarkTheme"),
  SamMarkdownThemes(theme: paraisoLightTheme, themeName: "paraisoLightTheme"),
  SamMarkdownThemes(theme: monoBlueTheme, themeName: "monoBlueTheme"),
  SamMarkdownThemes(theme: monokaiSublimeTheme, themeName: "monokaiSublimeTheme"),
  SamMarkdownThemes(theme: monokaiTheme, themeName: "monokaiTheme"),
  SamMarkdownThemes(theme: ideaTheme, themeName: "ideaTheme"),
  SamMarkdownThemes(theme: atelierLakesideDarkTheme, themeName: "atelierLakesideDarkTheme"),
  SamMarkdownThemes(theme: atelierLakesideLightTheme, themeName: "atelierLakesideLightTheme"),
  SamMarkdownThemes(theme: atelierPlateauLightTheme, themeName: "atelierPlateauLightTheme"),
  SamMarkdownThemes(theme: atelierPlateauDarkTheme, themeName: "atelierPlateauDarkTheme"),
  SamMarkdownThemes(theme: atelierSeasideLightTheme, themeName: "atelierSeasideLightTheme"),
  SamMarkdownThemes(theme: atelierSeasideDarkTheme, themeName: "atelierSeasideDarkTheme"),
  SamMarkdownThemes(theme: atelierSavannaLightTheme, themeName: "atelierSavannaLightTheme"),
  SamMarkdownThemes(theme: atelierSavannaDarkTheme, themeName: "atelierSavannaDarkTheme"),
  SamMarkdownThemes(theme: atelierSulphurpoolLightTheme, themeName: "atelierSulphurpoolLightTheme"),
  SamMarkdownThemes(theme: atelierSulphurpoolDarkTheme, themeName: "atelierSulphurpoolDarkTheme"),
  SamMarkdownThemes(theme: atelierHeathLightTheme, themeName: "atelierHeathLightTheme"),
  SamMarkdownThemes(theme: atelierHeathDarkTheme, themeName: "atelierHeathDarkTheme"),
  SamMarkdownThemes(theme: atelierForestLightTheme, themeName: "atelierForestLightTheme"),
  SamMarkdownThemes(theme: atelierForestDarkTheme, themeName: "atelierForestDarkTheme"),
  SamMarkdownThemes(theme: atelierEstuaryLightTheme, themeName: "atelierEstuaryLightTheme"),
  SamMarkdownThemes(theme: atelierEstuaryDarkTheme, themeName: "atelierEstuaryDarkTheme"),
  SamMarkdownThemes(theme: atelierDuneLightTheme, themeName: "atelierDuneLightTheme"),
  SamMarkdownThemes(theme: atelierDuneDarkTheme, themeName: "atelierDuneDarkTheme"),
];


class SamMarkdownThemes {
  
  final String themeName;
  final Map<String, TextStyle> theme;

  const SamMarkdownThemes({
    required this.theme,
    required this.themeName,
  });
}


const samTheme = {
  'root':
      TextStyle(color: Color(0xffa9b7c6), backgroundColor: Color(0xff282b2e)),
  'number': TextStyle(color: Color(0xff6897BB)),
  'literal': TextStyle(color: Color(0xff6897BB)),
  'symbol': TextStyle(color: Color(0xff6897BB)),
  'bullet': TextStyle(color: Color(0xff6897BB)),
  'keyword': TextStyle(color: Color(0xffcc7832)),
  'selector-tag': TextStyle(color: Color(0xffcc7832)),
  'deletion': TextStyle(color: Color(0xffcc7832)),
  'variable': TextStyle(color: Color(0xff629755)),
  'template-variable': TextStyle(color: Color(0xff629755)),
  'link': TextStyle(color: Color(0xff629755)),
  'comment': TextStyle(color: Color(0xff808080)),
  'quote': TextStyle(color: Color(0xff808080)),
  'meta': TextStyle(color: Color(0xffbbb529)),
  'string': TextStyle(color: Color(0xff6A8759)),
  'attribute': TextStyle(color: Color(0xff6A8759)),
  'addition': TextStyle(color: Color(0xff6A8759)),
  'section': TextStyle(color: Color(0xffffc66d)),
  'title': TextStyle(color: Color(0xffffc66d)),
  'type': TextStyle(color: Color(0xffffc66d)),
  'name': TextStyle(color: Color(0xffe8bf6a)),
  'selector-id': TextStyle(color: Color(0xffe8bf6a)),
  'selector-class': TextStyle(color: Color(0xffe8bf6a)),
  'emphasis': TextStyle(fontStyle: FontStyle.italic),
  'strong': TextStyle(fontWeight: FontWeight.bold),
};
