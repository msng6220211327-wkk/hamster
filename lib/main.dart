import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const HamsterGacha());
}

class HamsterGacha extends StatefulWidget {
  const HamsterGacha({super.key});

  @override
  State<HamsterGacha> createState() => _HamsterGachaState();
}

class _HamsterGachaState extends State<HamsterGacha> {
  int selectedImage = 0;
  int selectedDescription = 0;
  int e = 0;
  bool loading = false;

  final emojis = ['🐱', '🐾', '😺', '✨'];
  final descriptions = [
    '虚無',
    'おじさんの佇まい',
    '愛想笑いが限界',
    'スタイリッシュ',
    '手が人間の手',
    '人間社会に溶け込もうとしすぎるがなりきれない',
    '違う生き物の格好をする',
    '性格や表情が間反対',
    '「どうしてこうなった」感',
  ];
  final images = [
    'assets/images/hamster_01.jpg',
    'assets/images/hamster_02.png',
    'assets/images/hamster_03.jpg',
    'assets/images/hamster_04.jpg',
    'assets/images/hamster_05.jpg',
    'assets/images/hamster_06.jpg',
    'assets/images/hamster_07.jpg',
  ];

  Future<void> gacha() async {
    if (loading) return;

    setState(() => loading = true);

    await Future.delayed(const Duration(milliseconds: 50));

    if (!mounted) return;

    setState(() {
      final random = Random();
      selectedImage = random.nextInt(images.length);
      selectedDescription = random.nextInt(descriptions.length);
      e = (e + 1) % emojis.length;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('なんか可愛いやつアイデアブレストがちゃ')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 320,
                height: 220,
                child: loading
                    ? Center(
                        child: Text(
                          emojis[e],
                          style: const TextStyle(fontSize: 100),
                        ),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                images[selectedImage],
                                height: 220,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(child: Text('画像を表示できません')),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              height: 220,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                descriptions[selectedDescription],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 30),
              const Text('🎰', style: TextStyle(fontSize: 72)),
              ElevatedButton(
                onPressed: loading ? null : gacha,
                child: const Text('ガチャを回す！'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
