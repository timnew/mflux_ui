import 'dart:io';

class BinaryLocator {
  BinaryLocator._();

  static Future<void> checkBinary(String binaryPath) async {
    final file = File(binaryPath);

    if (!await file.exists()) {
      throw Exception("Binary $binaryPath not found");
    }

    final stat = await file.stat();
    final canReadAndExecute = ((stat.mode >> 6) & 0x7 & 0x5) > 0;

    if (!canReadAndExecute) {
      throw Exception("Binary $binaryPath is not executable");
    }
  }

  static Future<String> locateBinary() async {
    final process = await Process.run(
      "which",
      ["mflux-generate"],
      runInShell: true,
    );

    if (process.exitCode != 0) {
      throw Exception(
        "Failed to locate mflux-generate: Code ${process.exitCode}\n${process.stderr}\n${process.stdout}",
      );
    }

    final binaryPath = process.stdout.toString().trim();

    await checkBinary(binaryPath);

    return binaryPath;
  }
}
