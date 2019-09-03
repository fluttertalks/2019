import 'package:flutter/material.dart';
import 'package:flutter_talks/pages/search.dart';

import 'home.dart';

class Navigation extends StatefulWidget {

  final int currentPage;

  Navigation({Key key, this.currentPage}) : super (key: key);

  @override
  _NavigationState createState() => _NavigationState();

}

class _NavigationState extends State<Navigation> {
  int _selectedPage;
  List<String> _pageTitleList = ["pethero", "Pesquisar", "Favoritos", "Perfil"];
  String _pageTitle = "pethero";

  final _pageOptions = [
    Home(),
    Search(),
    Text("Teste navegação"),
    Text("Teste navegação"),
    //Favorites(),
    //Profile(),
  ];

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    super.initState();
    if(widget.currentPage != null){
      _selectedPage = widget.currentPage;
    }else{
      _selectedPage = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //endDrawer: buildFilterDrawer(_selectedPage),
      appBar: buildAppBar(_selectedPage, _pageTitle, context, scaffoldKey: _scaffoldKey),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _selectedPage == 0 || _selectedPage == 1 ? FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ) : null,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Início")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Pesquisar")),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text("Favoritos")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Perfil")),
        ],
        onTap: (int index){
          setState(() {
            _selectedPage = index;
            _pageTitle = _pageTitleList[index];
          });
        },
      ),
      body: _pageOptions[_selectedPage],
    );
  }
}

Widget buildAppBar(int _selectedPage, String _pageTitle, BuildContext context, {var scaffoldKey}){
  if (_selectedPage == 0){
    return AppBar(
      title: Text(
        "$_pageTitle",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        )
      ),
      centerTitle: true
    );
  } else {
    return AppBar(
      title: Text("$_pageTitle")
    );
  }
}