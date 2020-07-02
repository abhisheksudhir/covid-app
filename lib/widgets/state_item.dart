import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data.dart';
import '../screens/state_screen.dart';

class StateItem extends StatelessWidget {
  const StateItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      child: Center(child: const Text('Error')),
      builder: (ctx, states, ch) => states.items.length <= 0
          ? ch
          : ListView.separated(
              itemCount: states.items.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  child: Text(
                    '${i + 1}',
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                trailing: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total Cases',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${states.items[i].active}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                title: Text(
                  states.items[i].stateName,
                  // textAlign: TextAlign.start,
                ),
                // subtitle: Text(states.items[i].location.address),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    StateScreen.routeName,
                    arguments: states.items[i].id,
                  );
                },
              ),
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
    );
  }
}
