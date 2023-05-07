import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

List<SpaceMenuButton> sidebarSettingsPopupItems = [
  ShowArchivedButton(),
  CollapseFoldersButton(),
  LayoutSizeStyleButton(),
  DarkSideButton(),
];

List<SpaceMenuButton> spaceActionTraySearchAction = [
  TaskNameButton(),
  TaskDescriptionButton(),
  CustomFieldsButton()
];

List<SpaceMenuButton> spaceActionTraySubtasksAction = [
  CollapseAllButton(),
  ExpandAllButton(),
  AsSeprateTaskButton()
];


List<SpaceMenuButton> spaceActionTraySortBy = [
  SortByStatusButton(),
  SortByTaskNameButton(),
  SortByAssigneButton(),
  SortByPriorityButton(),
  SortByDueDateButton(),
  SortByStartDateButton(),
  SortByDateCreatedButton(),
  SortByDateUpdatedButton(),
  SortByDateClosedButton(),
  SortByTimeTrackedButton(),
  SortByTimeEstimatedButton(),
];


List<SpaceMenuButton> spaceTitleMoreAction = [
  CreateNewSpaceTitleButton(),
  RenameButton(),
  ColorAvatarButton(),
  CopyLinkButton(),
  AddFavoritesButton(section: 1),
  HideSidebarButton(section: 1),
  TemplatesButton(section: 2),
  MoreSettingsButton(section: 2),
  SharingPermissionButton(section: 3),
  ArchiveButton(section: 3),
  DeleteButton(section: 3)
];

List<SpaceMenuButton> spaceActionTrayShowActions = [
  SpaceMenuButton(
    addSwitch: true,
    prefixWidgets: [
      Text('Task Locations',
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    addSwitch: true,
    prefixWidgets: [
      Text('Subtask pervent names',
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 1,
    addSwitch: true,
    prefixWidgets: [
      Text('Closed subtasks',
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 1,
    addSwitch: true,
    prefixWidgets: [
      Text("Show assignees",
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 1,
    addSwitch: true,
    prefixWidgets: [
      Text("Collapse empty columns",
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 1,
    addSwitch: true,
    prefixWidgets: [
      Text("Show images on cards",
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 1,
    addSwitch: true,
    prefixWidgets: [
      Text("Show task IDs",
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 1,
    addSwitch: true,
    prefixWidgets: [
      Text("Show time tracker",
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 1,
    addSwitch: true,
    prefixWidgets: [
      Text("Tasks in Multiple Lists",
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 1,
    prefixWidgets: [
      Text("Custom Fields",
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
];

List<SpaceMenuButton> spaceActionTrayMoreActions = [
  SpaceMenuButton(
    addSwitch: true,
    prefixWidgets: [
      Icon(Icons.save_outlined, size: 20),
      SizedBox(
        width: 8,
      ),
      Text('Autosave view',
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 1,
    addSwitch: true,
    prefixWidgets: [
      Icon(Icons.safety_check_outlined, size: 20),
      SizedBox(
        width: 8,
      ),
      Text('Protect view', style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 1,
    addSwitch: true,
    prefixWidgets: [
      Icon(Icons.lock_outline, size: 20),
      SizedBox(
        width: 8,
      ),
      Text('Private view', style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 1,
    addSwitch: true,
    prefixWidgets: [
      Icon(Icons.home_outlined, size: 20),
      SizedBox(
        width: 8,
      ),
      Text('Default for all',
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    section: 2,
    prefixWidgets: [
      Icon(Icons.power_settings_new_outlined, size: 20),
      SizedBox(
        width: 8,
      ),
      Text('Reset view to Defaults',
          style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
];

List<SpaceMenuButton> spaceActionTrayGroupbyActions = [
  SpaceMenuButton(
    addSelect: true,
    selectValue: true,
    prefixWidgets: [
      SvgPicture.asset(
        'assets/icons/arrow_down_up.svg',
        height: 22,
        width: 22,
        color: Colors.blue,
      ),
      SizedBox(
        width: 8,
      ),
      Text('Status', style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    addSelect: true,
    prefixWidgets: [
      Icon(Icons.people_outline, size: 20),
      SizedBox(
        width: 8,
      ),
      Text('Assignee', style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    addSelect: true,
    prefixWidgets: [
      Icon(FontAwesomeIcons.tags, size: 18),
      SizedBox(
        width: 8,
      ),
      Text('Tags', style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    addSelect: true,
    prefixWidgets: [
      Icon(Icons.calendar_today_outlined, size: 18),
      SizedBox(
        width: 8,
      ),
      Text('Due date', style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    addSelect: true,
    prefixWidgets: [
      Icon(FontAwesomeIcons.ban, size: 18),
      SizedBox(
        width: 8,
      ),
      Text('None', style: TextStyle(fontSize: 12, color: Colors.black)),
    ],
    suffixWidgets: [],
  ),
  SpaceMenuButton(
    prefixWidgets: [
      SizedBox(width: 2),
      SvgPicture.asset(
        'assets/icons/edit_note.svg',
        height: 16,
        width: 16,
        color: Colors.blue,
      ),
      SizedBox(width: 8),
      Text(
        'Custom Fields',
        style: TextStyle(fontSize: 12, color: Colors.black),
      ),
    ],
  ),
];

class SpaceMenuButton {
  List<Widget> suffixWidgets;
  List<Widget> prefixWidgets;
  JustTheController? controller;
  List<SpaceMenuButton> subItems;
  String? subItemsHeader;
  bool addSwitch;
  bool addSelect;
  bool switchValue;
  bool selectValue;
  bool isNew;
  int section;

  SpaceMenuButton({
    this.prefixWidgets = const [],
    this.suffixWidgets = const [],
    this.subItems = const [],
    this.addSwitch = false,
    this.addSelect = false,
    this.switchValue = false,
    this.selectValue = false,
    this.isNew = false,
    this.section = 0,
    this.controller,
    this.subItemsHeader,
  });
}

class ShowArchivedButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  ShowArchivedButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 15,
    this.iconColor,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(Icons.archive_outlined, size: iconSize, color: iconColor),
            SizedBox(width: space),
            Text(
              'Show Archived',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class CollapseFoldersButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  CollapseFoldersButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 15,
    this.iconColor,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(Icons.keyboard_arrow_up_rounded,
                size: iconSize, color: iconColor),
            SizedBox(width: space),
            Text(
              'Collapse All Folders',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class LayoutSizeStyleButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  LayoutSizeStyleButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 15,
    this.iconColor,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(Icons.table_chart_outlined, size: iconSize, color: iconColor),
            SizedBox(width: space),
            Text(
              'Layout Size & Style',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class DarkSideButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  DarkSideButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 15,
    this.iconColor,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(Icons.dark_mode_outlined, size: iconSize, color: iconColor),
            SizedBox(width: space),
            Text(
              'Dark Side (bar)',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSwitch: true,
        );
}

class CreateNewSpaceTitleButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  CreateNewSpaceTitleButton({
    super.isNew,
    super.section,
    this.iconSize = 15,
    this.iconColor,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(Icons.add, size: iconSize, color: iconColor),
            SizedBox(width: space),
            Text(
              'Create New',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          controller: JustTheController(),
          subItems: [
            ListButton(),
            DocButton(section: 1),
            FormButton(section: 1),
            WhiteboardButton(section: 1),
            AddFolderButton(section: 2),
            FromTemplateButton(section: 3)
          ],
        );
}

class ListButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  ListButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/list_add.svg',
              height: iconSize,
              width: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              'List',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class DocButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  DocButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/add_document2.svg',
              height: iconSize,
              width: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              'Doc',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class FormButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  FormButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 20,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/form_office.svg',
              height: iconSize,
              width: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              'Form',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class WhiteboardButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  WhiteboardButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 20,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/whiteboard2.svg',
              height: iconSize,
              width: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              'Whiteboard',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class AddFolderButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  AddFolderButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/folder_add2.svg',
              height: iconSize,
              width: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              'Folder',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class FromTemplateButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  FromTemplateButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 16,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              FontAwesomeIcons.wandMagicSparkles,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              'From Template',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class RenameButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  RenameButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.edit,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Rename",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class ColorAvatarButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  ColorAvatarButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.water_drop_outlined,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Color & Avatar",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class CopyLinkButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  CopyLinkButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.link,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Copy Link",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class DuplicateButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  DuplicateButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.copy,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Duplicate",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class AddFavoritesButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  AddFavoritesButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.star_outline,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Add to Favorites",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class HideSidebarButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  HideSidebarButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 14,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              FontAwesomeIcons.eyeSlash,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Hide in my sidebar",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class TemplatesButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  TemplatesButton({
    super.isNew,
    super.section,
    this.iconSize = 16,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 10,
  }) : super(
            prefixWidgets: [
              Icon(
                FontAwesomeIcons.wandMagicSparkles,
                size: iconSize,
                color: iconColor,
              ),
              SizedBox(width: space),
              Text(
                "Templates",
                style: TextStyle(
                  fontSize: textSize,
                  color: textColor,
                ),
              ),
            ],
            controller: JustTheController(),
            subItemsHeader: "Templates",
            subItems: [
              BrowseTemplateButton(),
              SaveTemplateButton(),
              UpdateTemplateButton()
            ]);
}

class BrowseTemplateButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  BrowseTemplateButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.table_chart_outlined,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Browse Templates",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class SaveTemplateButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  SaveTemplateButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.save_outlined,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Save as Template",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class UpdateTemplateButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  UpdateTemplateButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.sync_outlined,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Update existing Template",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class MoreSettingsButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  MoreSettingsButton({
    super.isNew,
    super.section,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.settings_outlined,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "More Settings",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          controller: JustTheController(),
          subItems: [
            AllSpaceSettingsButton(),
            AutomationsButton(section: 1),
            CustomTaskFieldsButton(section: 1),
            TaskStatusButton(section: 1),
            SortAtoZFieldsButton(section: 2)
          ],
        );
}

class AllSpaceSettingsButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  AllSpaceSettingsButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.settings_outlined,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "All Space Settings",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class AutomationsButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  AutomationsButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 22,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 7,
  }) : super(
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/robot_space.svg',
              height: iconSize,
              width: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Automations",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class CustomTaskFieldsButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  CustomTaskFieldsButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 16,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            SizedBox(width: 2),
            SvgPicture.asset(
              'assets/icons/edit_note.svg',
              height: iconSize,
              width: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Custom Task Fields",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class TaskStatusButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  TaskStatusButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/minus_square.svg',
              height: iconSize,
              width: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Task statuses",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class SortAtoZFieldsButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  SortAtoZFieldsButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.sort_by_alpha_outlined,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Sort A to Z",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class SharingPermissionButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  SharingPermissionButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.share_outlined,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              'Sharing & Permission',
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class ArchiveButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  ArchiveButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.archive_outlined,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Archive",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class DeleteButton extends SpaceMenuButton {
  final double iconSize;
  final double textSize;
  final double space;
  final Color textColor;
  final Color? iconColor;

  DeleteButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.iconSize = 18,
    this.iconColor = Colors.red,
    this.textColor = Colors.red,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Icon(
              Icons.delete_outline_outlined,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(width: space),
            Text(
              "Delete",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
        );
}

class TaskNameButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  TaskNameButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(prefixWidgets: [
          Text(
            "Task Name",
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ),
          ),
        ], addSwitch: true);
}

class TaskDescriptionButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  TaskDescriptionButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(prefixWidgets: [
          Text(
            "Task Description",
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ),
          ),
        ], addSwitch: true);
}

class CustomFieldsButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  CustomFieldsButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(prefixWidgets: [
          Text(
            "Custom Fields",
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ),
          ),
        ], addSwitch: true);
}

class CollapseAllButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  CollapseAllButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Collapse All",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class ExpandAllButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  ExpandAllButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Expand All",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class AsSeprateTaskButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  AsSeprateTaskButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "As Seprate Task",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class SortByStatusButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  SortByStatusButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Status",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class SortByTaskNameButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  SortByTaskNameButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Task Name",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class SortByAssigneButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  SortByAssigneButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Assigne",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class SortByPriorityButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  SortByPriorityButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Priority",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class SortByDueDateButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  SortByDueDateButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Due date",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class SortByStartDateButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  SortByStartDateButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Start date",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class SortByDateCreatedButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  SortByDateCreatedButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Date created",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class SortByDateUpdatedButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  SortByDateUpdatedButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Date updated",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class SortByDateClosedButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  SortByDateClosedButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Date closed",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class SortByTimeTrackedButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  SortByTimeTrackedButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Date tracked",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}

class SortByTimeEstimatedButton extends SpaceMenuButton {
  final double textSize;
  final double space;
  final Color textColor;

  SortByTimeEstimatedButton({
    super.isNew,
    super.section,
    super.subItems,
    super.subItemsHeader,
    super.controller,
    this.textColor = Colors.black,
    this.textSize = 12,
    this.space = 8,
  }) : super(
          prefixWidgets: [
            Text(
              "Time estimate",
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
              ),
            ),
          ],
          addSelect: true,
        );
}