import 'dart:typed_data';
import 'package:e_lenden/providers/item_list.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generatePDF(List<Item> itemList) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: itemList.map((item) {
            return pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(item.name),
                pw.Text('Cost: \$${item.cost}, Quantity: ${item.quantity}'),
              ],
            );
          }).toList(),
        );
      },
    ),
  );

  return pdf.save();
}
