import 'package:flutter/material.dart';
import 'package:mocnels_momentum/models/product.dart';

class DetailProductPage extends StatelessWidget {
  final Product product;

  const DetailProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Produk")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text("Brand: ${product.fields.brand}"),
            Text("Harga: Rp${product.fields.price}"),
            Text("Stok: ${product.fields.stock}"),
            Text("Kategori: ${product.fields.category}"),
            Text("Deskripsi: ${product.fields.description}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Kembali ke Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
