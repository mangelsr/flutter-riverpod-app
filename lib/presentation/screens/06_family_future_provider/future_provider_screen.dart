import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/future_providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Future Provider'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (data) => Text(data),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('$error'),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-prev',
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              if (pokemonId > 1) pokemonId--;
              setState(() {});
              // ref.read(pokemonIdProvider.notifier).previousPokemon();
            },
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'btn-next',
            child: const Icon(Icons.arrow_forward),
            onPressed: () {
              pokemonId++;
              setState(() {});
              // ref.read(pokemonIdProvider.notifier).nextPokemon();
            },
          ),
        ],
      ),
    );
  }
}
