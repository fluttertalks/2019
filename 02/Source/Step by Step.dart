// PASSO 1 - MOSTRA PROJETO (HOME, SEARCH E PET_DETAILS)

// PASSO 2 - CONFIGURA CORES E ESTILOS DO PROJETO

	// PASSO 2.1 - CRIAR ARQUIVO COLORS.DART

  import 'package:flutter/material.dart';

  const kPrimaryDark = const Color(0xFF383DBA); // 100% of opacity
  const kPrimary = const Color(0xFF7268ED); // 100% of opacity
  const kPrimary87 = const Color(0xDE7268ED); // 87% of opacity
  const kPrimary60 = const Color(0x997268ED); // 60% of opacity
  const kPrimary38 = const Color(0x617268ED); // 38% of opacity
  const kPrimary12 = const Color(0x1F7268ED); // 12% of opacity

  const kTextDark = const Color(0xFF06081C); // 100% of opacity
  const kText = const Color(0xFF2E3142); // 100% of opacity
  const kText87 = const Color(0xDE2E3142); // 87% of opacity
  const kText60 = const Color(0x992E3142); // 60% of opacity
  const kText38 = const Color(0x612E3142); // 38% of opacity
  const kText12 = const Color(0x1F2E3142); // 12% of opacity

  const kWhite = const Color(0xFFFFFFFF); // 100% of opacity
  const kWhite70 = const Color(0xB3FFFFFF); // 70% of opacity
  const kWhite50 = const Color(0x80FFFFFF); // 50% of opacity

  const kDividerOnDark = const Color(0x1FFFFFFF); // 12% of opacity
  const kDividerOnLight = const Color(0x1F2E3142); // 12% of opacity
  const kBackground = const Color(0xFFFAFAFE); // 100% of opacity

  // PASSO 2.2 - MOSTRAR A PROPRIEDADE TYPOGRAPHY NO TEMA

	// PASSO 2.3 - MOSTRAR IMPORTAÇÃO DE FONTES NO PROJETO

	// PASSO 2.4 - CRIAR ARQUIVO TYPE_SYSTEM

  import 'package:flutter/material.dart';

  TextTheme buildTextTheme(TextTheme base) {
    return base.copyWith(
      title: base.title.copyWith(
        fontWeight: FontWeight.bold,
        color: kText,
      ),
      button: base.button.copyWith(
        fontWeight: FontWeight.bold,
      ),
      body1: base.body1.copyWith(
        color: kText60,
      ),
      body2: base.body2.copyWith(
        color: kText60,
      ),
      caption: base.caption.copyWith(
        color: kText60,
      ),
    ).apply(
      fontFamily: 'Nunito',
    );
  }

  // PASSO 2.5 - IMPORTAR TEXTTHEME

	textTheme: buildTextTheme(base.textTheme),

	// PASSO 2.6 - CONFIGURAR CORES E ESTILOS DO PROJETO

	accentColor: kPrimary,
	accentColorBrightness: Brightness.dark,
	backgroundColor: kBackground,
	brightness: Brightness.dark,
	colorScheme: ColorScheme(
	  background: kBackground,
	  primary: kPrimary,
	  primaryVariant: kPrimaryDark,
	  onPrimary: kWhite,
	  secondary: kText,
	  secondaryVariant: kTextDark,
	  surface: kWhite,
	  onSecondary: kWhite,
	  onSurface: kText,
	  onBackground: kText,
	  error: Colors.red,
	  onError: kWhite,
	  brightness: Brightness.dark,
	),
	cursorColor: kWhite,
	focusColor: kWhite70,
	highlightColor: kPrimary12,
	hintColor: kWhite50,
	indicatorColor: kWhite,
	primaryColor: kPrimary,
	primaryColorBrightness: Brightness.dark,
	primaryColorDark: kPrimaryDark,
	primaryColorLight: kPrimary12,
	selectedRowColor: kPrimary,
	scaffoldBackgroundColor: kBackground,
	splashColor: kPrimary12,
	textSelectionColor: kTextDark,
	textSelectionHandleColor: kTextDark,
	toggleableActiveColor: kPrimary,
	unselectedWidgetColor: kText38,

	// CONFIGURAÇÃO DOS CARDS
	cardTheme: CardTheme(
	  elevation: 0,
	  clipBehavior: Clip.hardEdge,
	  shape: RoundedRectangleBorder(
	    borderRadius: BorderRadius.all(Radius.circular(6)),
	    side: BorderSide(
	      color: kDividerOnLight,
	      width: 1,
	      style: BorderStyle.solid
	    )
	  )
	),

	// CONFIGURAÇÃO DOS CHIPS
	chipTheme: ChipThemeData(
	  backgroundColor: kBackground,
	  brightness: Brightness.light,
	  labelStyle: TextStyle(color: kText60),
	  disabledColor: kText12,
	  labelPadding: EdgeInsets.only(left: 12, right: 12),
	  selectedColor: kPrimary,
	  shape: RoundedRectangleBorder(
	    borderRadius: BorderRadius.all(Radius.circular(16)),
	    side: BorderSide(
	        color: kDividerOnLight,
	        width: 1,
	        style: BorderStyle.solid
	    ),
	  ),
	  padding: EdgeInsets.zero,
	  secondaryLabelStyle: TextStyle(color: kWhite),
	  secondarySelectedColor: kPrimary,
	),

	// CONFIGURAÇÃO DOS BOTÕES
	buttonColor: kPrimary,
	buttonTheme: ButtonThemeData(
	  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
	  colorScheme: ColorScheme(
	      primary: kPrimary,
	      primaryVariant: kPrimaryDark,
	      secondary: kPrimary,
	      secondaryVariant: kPrimaryDark,
	      surface: kWhite,
	      background: kBackground,
	      error: Colors.red,
	      onPrimary: kWhite,
	      onSecondary: kWhite,
	      onSurface: kText,
	      onBackground: kText,
	      onError: kWhite,
	      brightness: Brightness.light
	  ),
	),
	floatingActionButtonTheme: FloatingActionButtonThemeData(
	  backgroundColor: kPrimary,
	  elevation: 0,
	  focusElevation: 0,
	  highlightElevation: 0,
	  hoverElevation: 0,
	),

	// CONFIGURAÇÃO DOS TEXTFIELDS
	inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: kWhite50)),
    fillColor: kDividerOnDark,
    filled: true,
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: kWhite)),
    focusColor: kWhite,
    helperStyle: TextStyle(color: kWhite70),
    hintStyle: TextStyle(color: kWhite50),
    labelStyle: TextStyle(color: kWhite70, fontWeight: FontWeight.normal),
  ),

// PASSO 3 - ATUALIZAR HOME

	// ALTERAR ÍCONE E APPBAR NA NAVIGATION

	elevation: 0,
  leading: IconButton(
    icon: CustomIcon(icon: FontAwesomeIcons.arrowLeft, size: 20),
    onPressed: (){Navigator.pop(context);},
  ),

  // ALTERAR IMAGEM PRINCIPAL NA HOME

  image: AssetImage("assets/images/banner.png"),

  // ALTERAR RAISED BUTTON NA HOME

  elevation: 0,
  hoverElevation: 0,
  highlightElevation: 0,
  focusElevation: 0,
  disabledElevation: 0,
  child: Text("SAIBA COMO", style: Theme.of(context).textTheme.button.apply(color: kWhite)),
  onPressed: (){},

  // ALTERAR FAB NA NAVIGATION

  child: CustomIcon(icon: FontAwesomeIcons.plus, size: 20),

  // ALTERAR BOTTOM NAVIGATION NA NAVIGATION

  elevation: 4,
  unselectedItemColor: kText38,
  backgroundColor: kWhite,

  items: [
    BottomNavigationBarItem(icon: CustomIcon(icon: FontAwesomeIcons.home, size: 20), title: Text("Início")),
    BottomNavigationBarItem(icon: CustomIcon(icon: FontAwesomeIcons.search, size: 20), title: Text("Pesquisar")),
    BottomNavigationBarItem(icon: CustomIcon(icon: FontAwesomeIcons.solidHeart, size: 20), title: Text("Favoritos")),
    BottomNavigationBarItem(icon: CustomIcon(icon: FontAwesomeIcons.solidUser, size: 20), title: Text("Perfil")),
  ],

// PASSO 4 - ATUALIZAR PET PET_DETAILS

	// ALTERAR SLIVER APP BAR

	elevation: 0,
  title: Text(title, style: Theme.of(context).textTheme.title.apply(color: kWhite)),
  leading: IconButton(
    onPressed: (){Navigator.pop(context);},
    icon: CustomIcon(icon: FontAwesomeIcons.arrowLeft, size: 20, color: kWhite),
  ),

  IconButton(
    icon: CustomIcon(icon: FontAwesomeIcons.shareAlt, color: kWhite, size: 20),
    onPressed: (){},
  ),
  IconButton(
    icon: CustomIcon(icon: FontAwesomeIcons.heart, color: kWhite, size: 20),
    onPressed: (){},
  ),

  // ALTERAR RAISED BUTTONS

  elevation: 0,
  disabledElevation: 0,
  focusElevation: 0,
  highlightElevation: 0,
  hoverElevation: 0,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
  onPressed: (){},
  
  child: CustomIcon(icon: FontAwesomeIcons.whatsapp, size: 20, color: kWhite)
  child: CustomIcon(icon: FontAwesomeIcons.facebookF, size: 20, color: kWhite)
  child: Transform.rotate(angle: (2 * 3.14159 * -270) / 360, child: CustomIcon(icon: FontAwesomeIcons.phone, size: 20, color: kWhite)),

  // ALTERAR FAB BUTTON

  backgroundColor: kText,
  icon: CustomIcon(icon: FontAwesomeIcons.check, size: 20),
  label: Text("INFORMAR ADOÇÃO", style: Theme.of(context).textTheme.button.apply(color: kWhite)),

// PASSO 5 - SUBSTITUIR LOGIN E SIGN IN POR ARQUIVOS FINAIS







