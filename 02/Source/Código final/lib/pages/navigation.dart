import 'package:flutter/material.dart';
import 'package:flutter_talks/pages/search.dart';
import 'package:flutter_talks/theme/colors.dart';
import 'package:flutter_talks/widgets/custom_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        child: CustomIcon(icon: FontAwesomeIcons.plus, size: 20),
        onPressed: (){},
      ) : null,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        unselectedItemColor: kText38,
        backgroundColor: kWhite,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: CustomIcon(icon: FontAwesomeIcons.home, size: 20), title: Text("Início")),
          BottomNavigationBarItem(icon: CustomIcon(icon: FontAwesomeIcons.search, size: 20), title: Text("Pesquisar")),
          BottomNavigationBarItem(icon: CustomIcon(icon: FontAwesomeIcons.solidHeart, size: 20), title: Text("Favoritos")),
          BottomNavigationBarItem(icon: CustomIcon(icon: FontAwesomeIcons.solidUser, size: 20), title: Text("Perfil")),
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
        elevation: 0,
        leading: IconButton(
          icon: CustomIcon(icon: FontAwesomeIcons.arrowLeft, size: 20),
          onPressed: (){Navigator.pop(context);},
        ),
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
        elevation: 0,
      leading: IconButton(
        icon: CustomIcon(icon: FontAwesomeIcons.arrowLeft, size: 20),
        onPressed: (){Navigator.pop(context);},
      ),
      title: Text("$_pageTitle")
    );
  }
}