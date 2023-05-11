import 'package:objectbox/objectbox.dart';

@Entity()
class Settings {

  Settings(this.local);

  @Id()
  int id = 0;

  String local;

  String? markdownTheme;

  @Property(type: PropertyType.date)
  DateTime? date;
}
