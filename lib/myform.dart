import 'package:flutter/material.dart';
import 'myexpansion.dart';

String selectedOption = "Dog";
int selectedRadio = 1;

class MyForm extends StatefulWidget {
  // const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                labelText: 'Name',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  labelText: 'Email'),
            ),
            SizedBox(
              height: 16,
            ),
            // Text('Select your favorite animal'),
            DropdownButton<String>(
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              items: ['Dog', 'Cat', 'Mouse', 'Rabbit'].map((String option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              isExpanded: true,
              hint: Text('Select an option'),
            ),
            SizedBox(
              height: 16,
            ),
            Text('Select your gender'),
            RadioListTile(
                title: Text('Male'),
                value: 1,
                groupValue: selectedRadio,
                onChanged: (int? value) {
                  setState(() {
                    selectedRadio = value ?? 1;
                  });
                }),
            RadioListTile(
                title: Text('Female'),
                value: 2,
                groupValue: selectedRadio,
                onChanged: (int? value) {
                  setState(() {
                    selectedRadio = value ?? 1;
                  });
                }),
            RadioListTile(
                title: Text('Others'),
                value: 3,
                groupValue: selectedRadio,
                onChanged: (int? value) {
                  setState(() {
                    selectedRadio = value ?? 1;
                  });
                }),
            ElevatedButton(
              onPressed: () {
                submitForm(this.context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void submitForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Success'),
        content: Text('Saved Successfully'),
        actions: [
          ElevatedButton(onPressed: () {}, child: Text("Back")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => MyExpansion())));
              },
              child: Text("Next")),
        ],
      );
    },
  );
}
