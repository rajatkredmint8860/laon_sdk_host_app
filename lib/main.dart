import 'package:flutter/material.dart';
import 'package:loan_sdk_package/app/data/models/request/sdk_request.dart';
import 'package:loan_sdk_package/loan_sdk_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController textEditingController =
      TextEditingController(text: "9876543210");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                bool isProd = false;
                String clientId = "";
                String clientSecret = "";
                String env = "";
                String program = "";
                String anchorId = "";

                 clientId = "your_client_id";
                 clientSecret = "your_client_secret";
                 anchorId = "your_anchor_id";
                 env = "env";
                 program = "your_program_id";

                LoanSdkPackage.open(
                  context: context,
                  environment: env,
                  sdkRequest: SdkRequest.fromJson({
                    "username": textEditingController.text,
                    "source": "MOS",
                    "program": program,
                    "requestId": "REQ123456789",
                    "puId": "samplePuId",
                    "anchorId": anchorId,
                    "channel": "SDK",
                    "version": "v1",
                    "userContext": {
                      "pan": "ABCDE1234F",
                      "name": "John Doe",
                      "gender": "Male",
                      "email": "john.doe@example.com",
                      "dob": "1997-05-08",
                      "address": {
                        "addressLine1": "Sector 16A",
                        "addressLine2": "Near Metro Station",
                        "city": "Faridabad",
                        "state": "Haryana",
                        "pincode": "121002"
                      }
                    },
                    "clientMeta": {
                      "productNo": "PRD001",
                      "productName": "Sample Product",
                      "sumInsured": 50
                    },
                    "clientId": clientId,
                    "clientSecret": clientSecret,
                  }),
                  onClose: ({
                    required String message,
                    required String status,
                  }) {
                    debugPrint("SDK Closed");
                  },
                  onSuccess: ({
                    required String message,
                    required String status,
                  }) {
                    debugPrint("SDK Success");
                  },
                  onFailure: ({
                    required String message,
                    required String status,
                  }) {
                    debugPrint("SDK Failure");
                  },
                );
              },
              child: Text("Open sdk"),
            ),
          ],
        ),
      ),
    );
  }
}
