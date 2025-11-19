import 'package:flutter/material.dart';
import 'package:mocnels_momentum/models/product.dart';

class DetailProductPage extends StatelessWidget {
  final Product product;

  const DetailProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.fields.name,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildDetailRow("Brand", product.fields.brand),
              _buildDetailRow("Harga", "Rp${product.fields.price}"),
              _buildDetailRow("Stok", "${product.fields.stock}"),
              _buildDetailRow("Kategori", product.fields.category),
              _buildDetailRow("Deskripsi", product.fields.description),
              _buildDetailRow(
                "Featured",
                product.fields.isFeatured ? "Ya" : "Tidak",
              ),
              _buildDetailRow(
                "Dibuat pada",
                product.fields.createdAt.toString().substring(0, 10),
              ),

              const SizedBox(height: 20),
              if (product.fields.thumbnail.isNotEmpty)
                Image.network(
                  product.fields.thumbnail,
                  errorBuilder: (context, error, stackTrace) =>
                      const Text("Gagal memuat gambar thumbnail"),
                ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Kembali ke Daftar Item"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              "$label:",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
