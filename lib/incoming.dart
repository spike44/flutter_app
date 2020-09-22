import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class incoming extends StatefulWidget {
  @override
  State createState() => dataTableState();
}

class dataTableState extends State<incoming> {
  final _barcodeText = TextEditingController();
  List<DataRow> _rowList = [];
  FocusNode _barcodeTextFocus;

  @override
  void initState() {
    super.initState();
    // myFocusNode에 포커스 인스턴스 저장.
    _barcodeTextFocus = FocusNode();
  }

  @override
  void dispose() {
    // 폼이 삭제되면 myFocusNode도 삭제됨
    _barcodeTextFocus.dispose();
    super.dispose();
  }

  void _changeDataTable(String barcode) {
    setState(() {
      _rowList.add(DataRow(cells: <DataCell>[
        DataCell(Text(barcode)),
      ]));
      _barcodeText.clear();
      _barcodeTextFocus.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget dataSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                  label: Text(
                '바코드',
              ))
            ],
            rows: _rowList,
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("신진 텍스 PDA"),
      ),
      body: ListView(
        children: [
          CupertinoTextField(
              controller: _barcodeText,
              placeholder: "바코드를 스캔하세요",
              autofocus: true,
              focusNode: _barcodeTextFocus,
              expands: false,
              onSubmitted: (String barcode) {
                _changeDataTable(_barcodeText.text);
              }),
          dataSection
        ],
      ),
    );
  }
}
