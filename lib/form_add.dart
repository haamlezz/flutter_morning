import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;

class FormAdd extends StatefulWidget {
  @override
  _FormAddState createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _addProduct(Map<String, dynamic> values) async {
    String uri = "";
    if (kIsWeb) {
      uri = '127.0.0.1';
    } else {
      uri = '10.0.2.2';
    }
    var apiUrl = 'http://$uri:3002/products';
    print(apiUrl);

    var product = {
      "pro_name": values['pro_name'],
      "price": int.parse(values['price']),
      "cat_id": int.parse(values['cat_id'])
    };

    var response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(product),
    );
    print(response.statusCode);

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Failed to add product: ${response.statusCode}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                name: 'id',
                decoration: InputDecoration(
                  labelText: 'Product ID',
                ),
              ),
              FormBuilderTextField(
                name: 'pro_name',
                decoration: InputDecoration(
                  labelText: 'Product Name',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              FormBuilderTextField(
                name: 'price',
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
              FormBuilderTextField(
                name: 'cat_id',
                decoration: InputDecoration(
                  labelText: 'Category ID',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    _addProduct(_formKey.currentState!.value);
                  } else {
                    print("Validation failed");
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
