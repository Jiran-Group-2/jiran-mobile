import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat('dd MMM yyyy');
DateFormat yearFormat = DateFormat('yyyy');
DateFormat monthYearFormat = DateFormat('MMM yyyy');
DateFormat dateOnlyFormat = DateFormat('yyyy-MM-dd');
DateFormat dateMyFormat = DateFormat('dd/MM/yyyy');
DateFormat formDateTimeFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
DateFormat dayDateFormat = DateFormat('E, d MMM yyyy');
DateFormat timeFormat = DateFormat('HH:mm');
DateFormat dateTimeFormat = DateFormat('dd MMM yyyy, HH:mm');

extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
}