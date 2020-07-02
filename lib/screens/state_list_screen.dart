import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data.dart';
import '../widgets/state_item.dart';

class StateListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of States')),
      body: FutureBuilder(
        future: Provider.of<Data>(
          context,
          listen: false,
        ).fetchStates(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : StateItem(),
      ),
    );
  }
}


