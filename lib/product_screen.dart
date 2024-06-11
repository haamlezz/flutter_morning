import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    String uri = "";
    if (kIsWeb) {
      uri = '127.0.0.1';
    } else {
      uri = '10.0.2.2';
    }
    var apiUrl = 'http://$uri:3002/products';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        _products = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Failed to load products: ${response.statusCode}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                var product = _products[index];
                return ListTile(
                  title: Text(product['pro_name']),
                  subtitle: Text('Price: ${product['price']}'),
                  trailing: Text('Category ID: ${product['cat_id']}'),
                );
              },
            ),
    );
  }
}
