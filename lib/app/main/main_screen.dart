import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:mfluxui/features/find_service.dart';
import 'package:mfluxui/features/generation.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'generation_form.dart';
import 'generation_store.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final GenerationStore _store;

  @override
  void initState() {
    super.initState();
    _store = GenerationStore(
      findService(),
      findService(),
      findService(),
    );

    reaction(
      (_) => _store.state,
      (status) {
        status.whenOrNull(
          error: (e) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error generating image: $e'),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Provider.value(
        value: _store,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Observer(
              builder: (context) => _store.state.maybeWhen(
                initializing: () =>
                    const _MessagePanel(message: "Initializing..."),
                initializationFailed: (message) => _InitializationFailedPanel(
                  message: message,
                ),
                orElse: () => _Content(store: _store),
              ),
            ),
          ),
        ),
      );
}

class _Content extends StatelessWidget {
  final GenerationStore store;

  const _Content({required this.store});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          _PanelContainer(
            child: GenerationForm(store: store),
          ),
          Observer(
            builder: (_) => store.state.maybeWhen(
              generating: () => const _PanelContainer(
                flex: 2,
                child: _MessagePanel(message: "Generating..."),
              ),
              progress: (output) => _PanelContainer(
                flex: 2,
                child: _MessagePanel(message: output),
              ),
              success: (fileName) => _PanelContainer(
                flex: 2,
                child: _ImagePreview(fileName: fileName),
              ),
              error: (message) => _PanelContainer(
                flex: 2,
                child: _MessagePanel(message: message),
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        ],
      );
}

class _MessagePanel extends StatelessWidget {
  final String message;
  const _MessagePanel({required this.message});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(message),
      );
}

class _InitializationFailedPanel extends StatelessWidget {
  final String message;

  const _InitializationFailedPanel({
    required this.message,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Failed to locate mflux-generate binary"),
            if (message.isNotEmpty) ...[
              const Gap(16),
              Text(message),
            ],
            const Gap(32),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Manual Set mflux-generate Path',
              ),
              controller: context.read<GenerationStore>().binaryPathController,
            ),
            const Gap(32),
            TextButton(
              onPressed: () =>
                  context.read<GenerationStore>().tryLocateBinary(),
              child: const Text("Try again"),
            ),
          ],
        ),
      );
}

class _PanelContainer extends StatelessWidget {
  final Widget child;
  final int flex;

  const _PanelContainer({required this.child, this.flex = 1});

  @override
  Widget build(BuildContext context) => Flexible(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      );
}

class _ImagePreview extends StatelessWidget {
  final String fileName;

  const _ImagePreview({required this.fileName});

  @override
  Widget build(BuildContext context) => Image.file(File(fileName));
}
