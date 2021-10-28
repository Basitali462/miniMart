import 'package:flutter_demo_design/config/models/items_fields_model.dart';
import 'package:gsheets/gsheets.dart';

class SheetApi{
  static const credentials = r'''
  {
  "type": "service_account",
  "project_id": "minimartsheet",
  "private_key_id": "78e98c06a04c4bb6972e53966a143a8f1119cfaa",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCxj4nQfkr6Wp34\nZZCmhbwZGvLsefycAEwl8w3jUPHGKZbRwKSmvtj9OCRZ0z8CzAb+LdNZGEnG/FK9\nLecM0QAHL5QRBXvinCAapNr/8ZtBTnXjS0tteJMEUbWmoZS5EtBRfoyCKLCzqR3q\nG3CM36EldPrMSZ7Q6tvvxDt5mKLmgb0ahn7pl8YRj9n6lEYREgyh0XxYMDKQ9jPz\nsQ14NEWsQ9JYuhzoFEFcbPN45LRjA6+U0mHHNJtNRcwRgVZZBlexNqySsRGHn43o\nxOnlg2Y05KdVBH+M9Z7i81FUy4rQz6cz6IG42HyAmVK2PddrK/8knEsvbC9xZA/C\ntBcBit/HAgMBAAECggEAHSNI97CXQpjhmNmnRdcRvwJFIGQEUuAESatRJB8sYzB/\n/NEi3potpvWHlutWSRyM0+QBQtBRixiXxfkPvsgCu9XQSTAf3FgdN0IbuNSVKGpl\nE3T6Xm84RlqCTLicsfenEo3fJkeMd8R7kZIJ2OmkhYO6LxFbFpLz9Ky8ddUue6pD\nIK/U0Ja45wLvxGahHdipZHBCGZUqyZjOgQk+51aNG4Ce8iCLOQfjUdYV0ELQEwjX\n8C0wPL20xhpBR+DTXpQ+ollzJNEHZwL3vHC9fAPwn8mK+7pbLiwvadJo1UpdXmAs\nd9svn9CjlLuo8N/CyDjMrS5DgTk55JTNpKRPLNxKwQKBgQDo+2wY04GOL4N+VMRs\nhSKAv/NtJSv/ZlhR82ngVpYSjnsNhixgHA3opiK8Jl4lkJ7W4T5D78mWUuZDAAzX\nClw9HeAZd2sLH5FIaHdO2ZW5zpCK0jU5qPO2qLxRENHp6CTB37mRSgTbYN33DPDi\nICS+Yc2k9OVxpb0zCOZdKF3FNQKBgQDDGmYfPJiga0GUicsl7dZdS9Vl3Ta//ILG\nqZNJLIhyzDUxDDPKiKp0yoFipw+opPyMMDABKvA4Xd0bNBAgnWJg4JY80ewrSQXb\n5ANbI8L4a0qmow40O01wHTnr1VK/3iAh4nEoSLwP8+NGy/El2lYJlatG1f6CsBIV\nkPEeTbMciwKBgERZDdsyoT0vHyo+f+k+HWMb7LPGReQFCD/yYssXW6tR9TOAeyAu\n2r23j1UXBGOMy6xKI9QWUlMxOq/JIfsr5OdhDk8qQ1LeDebqDqYpGs2JlcnD5S1n\nLSgW1DgL8Sjnm3DsyymeR1J8VmGVgE02FNFtK8EKvwzaDGkeYUZPA0NJAoGBAKX4\nZB14iAIXm99HZQisDeqp4yxXhgbGQV3Mzd22w5CcxTcnQTuvDQpzZqPMqFZ3m9uJ\n9pxXsajRuJE2te141ULCayvsDHM6GIDZtD0o6+g2JXgiR6gJNrQEOMy1WUKdLEqG\n/modjdYoTBRi04628PAQYXbN/kegjpHIDkYQJSlHAoGBALNNkzvInVdIBV6pWpey\nf0yuR5nhf5mPkzovLTzVGuUQqBn7dAdwgOysuWQn1pvoN+yai/CSQ6FngVV8t0wK\nTL5lwTPNwVn3/hdiNzAu2ZkR/DSLW4CNFFMQVgHzxP5bRs3KtusutYeyMr4N87Dp\nP6mDwCZJ8m6KjWK8im4UEDTt\n-----END PRIVATE KEY-----\n",
  "client_email": "minimartsheet@minimartsheet.iam.gserviceaccount.com",
  "client_id": "107894577410870481208",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/minimartsheet%40minimartsheet.iam.gserviceaccount.com"
}
  ''';
  static final spreadSheetId = '1plbhJfqykPJ-xd_AC2CEth_vqfWdsaj2fyb5J1XLfw0';
  static final gSheet = GSheets(credentials);
  static Worksheet userSheet;

  static Future init() async{
    try{
      final spreadSheet = await gSheet.spreadsheet(spreadSheetId);
      userSheet = await getWorkSheet(spreadSheet, title: 'good');
      final firstRow = ItemFields.getFields();
      userSheet.values.insertRow(1, firstRow);
    }catch (e){
      print('init error: $e');
    }
  }

  static Future<Worksheet> getWorkSheet(Spreadsheet spreadsheet, { String title}) async {
    try{
      return await spreadsheet.addWorksheet(title);
    } catch (e){
      return spreadsheet.worksheetByTitle(title);
    }
  }

  static Future<int> getRowCount() async{
    if(userSheet == null) return 0;

    final lastRow = await userSheet.values.lastRow();
    //print(int.parse(lastRow.first));
    return lastRow == null || lastRow.first == 'id' ? 0 : int.parse(lastRow.first) ?? 0;
  }

  static Future insert(List<Map<String, dynamic>> rowList) async{
    if(userSheet == null) return;

    userSheet.values.map.appendRows(rowList);
  }
}