import 'package:flutter/material.dart';

class WasteSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onScanQr;

  const WasteSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onScanQr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          const Icon(
            Icons.search_rounded,
            color: Color(0xFF6D7A72),
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(
                fontFamily: 'Jakarta',
                fontSize: 13,
                color: Color(0xFF131B2E),
              ),
              decoration: const InputDecoration(
                hintText: 'Cari jenis sampah (misal: botol PET, kardus ...',
                hintStyle: TextStyle(
                  fontFamily: 'Jakarta',
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8B9890),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onScanQr,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Icon(
                  Icons.qr_code_scanner_rounded,
                  color: Color(0xFF6D7A72),
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
