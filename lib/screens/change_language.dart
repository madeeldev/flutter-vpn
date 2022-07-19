import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vpn/screens/home_screen.dart';

const kColorBg = Color(0xffE6E7F0);

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {

  final List _langData = [
    {
      'src': 'assets/images/usa.jpeg',
      'lang': 'English'
    },
    {
      'src': 'assets/images/canada.png',
      'lang': 'French'
    },
    {
      'src': 'assets/images/pakistan.jpeg',
      'lang': 'Urdu'
    },
    {
      'src': 'assets/images/india.png',
      'lang': 'Hindi'
    },
    {
      'src': 'assets/images/ghana.png',
      'lang': 'Asante Twi'
    },
  ];

  List _searchedLangData = [];

  bool _isGridView = false;
  final _searchLanguageController = TextEditingController();

  @override
  void initState() {
    _searchedLangData = _langData;
    //
    super.initState();
  }

  _loadSearchedLanguages(String? textVal) {
    if(textVal != null && textVal.isNotEmpty) {
      final data = _langData.where((lang) {
        return lang['lang'].toLowerCase().contains(textVal.toLowerCase());
      }).toList();
      setState(() => _searchedLangData = data);
    } else {
      setState(() => _searchedLangData = _langData);
    }
  }

  _clearSearch() {
    _searchLanguageController.clear();
    setState(() => _searchedLangData = _langData);
  }

  @override
  void dispose() {
    _searchLanguageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: kColorBg,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: kColorBg,
            statusBarBrightness: Brightness.light, // For iOS: (dark icons)
            statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
          ),
        ),
      ),
      backgroundColor: kColorBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
          child: Column(
            children: [
              /// header action icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen())),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  const Text(
                    'Languages',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),
                  ),
                  GestureDetector(
                      onTap: () => setState(() => _isGridView = !_isGridView),
                      child: _isGridView ? const Icon(Icons.grid_view,) : const Icon(Icons.view_list,)
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20,),
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 44,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: _searchLanguageController,
                  onChanged: _loadSearchedLanguages,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey.shade400,),
                    hintText: 'Search here',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold),
                    suffixIcon: _searchLanguageController.text.isNotEmpty ? IconButton(icon: const Icon(Icons.clear), onPressed: _clearSearch,) : null,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'All Languages',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Expanded(
                child: _isGridView ? _loadGridView() : _loadListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadGridView() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 160.0,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      children: List.generate(_searchedLangData.length, (idx) {
        return Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            child: InkWell(
              splashColor: Colors.redAccent,
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen())),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(_searchedLangData[idx]['src']),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    _langData[idx]['lang'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
      }),
    );
  }

  Widget _loadListView() {
    return ListView.builder(
      itemCount: _searchedLangData.length,
      itemBuilder: (BuildContext context, int idx) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            child: ListTile(
              onTap: () {},
              leading: SizedBox(
                width: 36,
                height: 36,
                child: CircleAvatar(
                  backgroundImage: AssetImage(_searchedLangData[idx]['src']),
                ),
              ),
              title: Text(
                _searchedLangData[idx]['lang'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18,),
            ),
          ),
        );
      },
    );
  }
}
