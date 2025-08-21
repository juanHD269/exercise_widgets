import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica de Widgets',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const MenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ---------------- MENU -----------------
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ExampleLayout()));
              },
              child: const Text("Example layout"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ExampleCounter()));
              },
              child: const Text("Example counter"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ExampleList()));
              },
              child: const Text("List dynamic"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ExampleImage()));
              },
              child: const Text("Example image"),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- LAYOUT -----------------
class ExampleLayout extends StatelessWidget {
  const ExampleLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example layout")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width: 100, height: 100, color: Colors.red),
                const SizedBox(width: 20),
                Container(width: 100, height: 100, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text("Texto superpuesto", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.home),
                SizedBox(width: 10),
                Text("Element 1"),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.search),
                SizedBox(width: 10),
                Text("Element 2"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- COUNTER -----------------
class ExampleCounter extends StatefulWidget {
  const ExampleCounter({super.key});

  @override
  State<ExampleCounter> createState() => _ExampleCounterState();
}

class _ExampleCounterState extends State<ExampleCounter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contador: $counter", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => counter++),
                  child: const Text("Aumentar"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => setState(() => counter--),
                  child: const Text("Disminuir"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- LIST -----------------
class ExampleList extends StatefulWidget {
  const ExampleList({super.key});

  @override
  State<ExampleList> createState() => _ExampleListState();
}

class _ExampleListState extends State<ExampleList> {
  List<String> items = List.generate(12, (index) => "Elemento ${index + 1}");

  void _addItem() {
    setState(() {
      items.add("Elemento ${items.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example List")),
      body: ListView(
        children: items
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(
                  children: [
                    const Icon(Icons.list),
                    const SizedBox(width: 10),
                    Text(e),
                  ],
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ---------------- NUEVA PANTALLA -----------------
class ExampleImage extends StatefulWidget {
  const ExampleImage({super.key});

  @override
  State<ExampleImage> createState() => _ExampleImageState();
}

class _ExampleImageState extends State<ExampleImage> {
  bool showImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example Image")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Presiona el botón para mostrar u ocultar la imagen"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showImage = !showImage;
                });
              },
              child: Text(showImage ? "Ocultar" : "Mostrar"),
            ),
            const SizedBox(height: 20),
            if (showImage)
              Image.network(
                "https://flutter.dev/assets/homepage/carousel/slide_1-layer_0-6e3a7fc5b2dd8cdb7e05a6d6a5378435.png",
                width: 200,
              ),
          ],
        ),
      ),
    );
  }
}
