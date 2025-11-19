import 'package:flutter/material.dart';
import 'package:mocnels_momentum/models/product.dart';

class DetailProductPage extends StatelessWidget {
  final Product product;

  const DetailProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              if (product.fields.thumbnail.isNotEmpty)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      product.fields.thumbnail,
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, err, _) =>
                          const Icon(Icons.broken_image, size: 100),
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              // Nama
              Text(
                product.fields.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Detail Atribut
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _detailRow("Brand", product.fields.brand),
                      const Divider(),
                      _detailRow("Harga", "Rp${product.fields.price}"),
                      const Divider(),
                      _detailRow("Kategori", product.fields.category),
                      const Divider(),
                      _detailRow("Stok", "${product.fields.stock}"),
                      const Divider(),
                      _detailRow(
                        "Featured",
                        product.fields.isFeatured ? "Ya" : "Tidak",
                      ),
                      const Divider(),
                      _detailRow(
                        "Dibuat Pada",
                        product.fields.createdAt.toString().split(' ')[0],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Deskripsi
              const Text(
                "Deskripsi:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                product.fields.description,
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 40),

              // Tombol Kembali (Tugas 6c)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Kembali ke Daftar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
