import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uix/flutter_uix.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/localization/language.dart';
import '../core/providers.dart';
import '../utils/helpers.dart';
// import '../../widgets/dialogs/language_picker_dialog.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  Widget _buildRowFixTitleRadio(List<Map<String, dynamic>> items, var value,
      ValueChanged<String> onValueChanged) {
    return SizedBox(
      width: 320,
      height: 100,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2.8,
        children: items
            .map(
              (item) => ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 120.0, height: 36.0),
                child: RadioListTile<String>(
                  value: item['value'],
                  title: Text(item['name']),
                  groupValue: value,
                  onChanged: (value) => onValueChanged(value!),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    final app = ref.watch(appProvider);
    return LayoutBuilder(builder: (context, cs) {
      return Scaffold(
        appBar: AppBar(
          // backgroundColor: Color(0xffE6E6EC),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "settings".tr(),
            style: textStyle(context, 17),
          ),
          // actionsIconTheme: IconThemeData(color: Colors.amberAccent),
          iconTheme: const IconThemeData(color: Color(0xff222333)),
        ),
        backgroundColor: const Color(0xffE6E6EC),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      // baseFlash(
                      //   context,
                      //   (contr) => LanguagePickerDialog(
                      //     height: cs.maxHeight * 0.45,
                      //     width: cs.maxWidth * 0.5,
                      //     isSearchable: true,
                      //     languages: [Languages.persian, Languages.english],
                      //     onValuePicked: (language) {
                      //       EasyLocalization.of(context)!.setLocale(
                      //           Locale(language.isoCode, language.countryCode));
                      //       app.conf.put(
                      //           "local",
                      //           Locale(language.isoCode, language.countryCode)
                      //               .toString());
                      //       contr.dismiss();
                      //     },
                      //   ),
                      //   dismissHorizental: true,
                      //   boxShadows: <BoxShadow>[],
                      // );
                    },
                    child: Container(
                      width: cs.maxWidth,
                      height: cs.maxHeight * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        children: [
                          const Icon(Icons.language, color: Color(0xff233444)),
                          (cs.maxWidth * 0.06).widthBox,
                          Text(
                            "language".tr(),
                            style:
                                textStyle(context, 15, weight: FontWeight.w400),
                          ),
                        ],
                      ).pSy(x: cs.maxWidth * 0.03, y: cs.maxHeight * 0.02),
                    ),
                  ),
                ],
              ),
            )
          ],
        ).pSy(x: cs.maxWidth * 0.02),
      );
    });
  }
}
