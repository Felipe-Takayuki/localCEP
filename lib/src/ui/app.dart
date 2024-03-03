import 'package:flutter/material.dart';
import 'package:local_cep/src/ui/pages/searchCEP/search_cep_page.dart';
import 'package:local_cep/src/ui/theme/theme.dart';

class App extends StatelessWidget {

  const App({ super.key });

   @override
   Widget build(BuildContext context) {
       return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const SearchCepPage(),
       );
  }
}