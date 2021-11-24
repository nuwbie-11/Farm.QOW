// ignore_for_file: file_names

import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generateCenteredText(String text) async {
    final pdf = Document();

    pdf.addPage(Page(
      build: (context) => Center(child: Text(text)),
    ));
    return saveDocument(name: 'newexample.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();
    final path = (await getExternalStorageDirectory());
    final file = File(path!.path + "/" + name);
    if (file.existsSync() == false) {
      print("false");
      file.create();
    }
    await file.writeAsBytes(bytes);

    return file;
  }

  static Future open(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }

  static Future<File> generateTable(result) async {
    final pdf = Document();

    pdf.addPage(Page(
      build: (context) => Table(
        border: TableBorder.all(),
        columnWidths: <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(),
          2: FixedColumnWidth(64),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              Text("Bulan",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
              Text(
                "Grade A",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Grade B+",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Grade B-",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Grade C",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Total",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          for (int i = 0; i < 12; i++)
            TableRow(
              children: <Widget>[
                Text(
                  "Bulan " + (i + 1).toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  result[i][0].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  result[i][1].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  result[i][2].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  result[i][3].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  (result[i][0] + result[i][1] + result[i][2] + result[i][3])
                      .toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
        ],
      ),
    ));
    final filename = "tabel" + (DateTime.now()).toString();
    return saveDocument(name: filename, pdf: pdf);
  }
}
