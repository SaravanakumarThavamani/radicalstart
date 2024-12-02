import 'package:flutter/cupertino.dart';

import 'package:imag/Tasks/provider/view/providerscreen.dart';
import 'package:provider/provider.dart';

import 'controller/controller_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProviderController(), child: ProviderCalculator());
  }
}
