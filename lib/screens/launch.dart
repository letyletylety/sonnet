import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sonnet/screens/read.dart';

import '../bloc/reader.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  late ReaderBloc readerBloc;

  @override
  void initState() {
    super.initState();
    readerBloc = Provider.of<ReaderBloc>(context, listen: false);
  }

  @override
  void dispose() {
    readerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300.0,
          child: Column(
            children: [
              const Text('Shakespeare\'s Sonnets',
                  style: TextStyle(fontSize: 26.0)),
              const Text('Sonnet 64', style: TextStyle(fontSize: 15.0)),
              const SizedBox(
                height: 80.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child:
                    const Text('Engage', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  readerBloc.startReading();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Read()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
