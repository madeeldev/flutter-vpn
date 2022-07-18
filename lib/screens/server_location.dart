import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kColorBg = Color(0xffE6E7F0);

class ServerLocation extends StatefulWidget {
  const ServerLocation({Key? key}) : super(key: key);

  @override
  State<ServerLocation> createState() => _ServerLocationState();
}

class _ServerLocationState extends State<ServerLocation> {

  List _serverData = [];
  List _searchedServerData = [];

  final _searchServerController = TextEditingController();

  @override
  void initState() {
    _loadServerData();
    //
    super.initState();
  }

  @override
  void dispose() {
    _searchServerController.dispose();
    super.dispose();
  }

  Future<void> _loadServerData() async {
    final String response = await rootBundle.loadString('server/server.json');
    final data = await json.decode(response);
    setState(() {
      _serverData = data;
      _searchedServerData = data;
    });
  }

  _loadSearchedServers(String? textVal) {
    if(textVal != null && textVal.isNotEmpty) {
      final data = _serverData.where((server) {
        return server['name'].toLowerCase().contains(textVal.toLowerCase());
      }).toList();
      setState(() => _searchedServerData = data);
    } else {
      setState(() => _searchedServerData = _serverData);
    }
  }

  _clearSearch() {
    _searchServerController.clear();
    setState(() => _searchedServerData = _serverData);
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
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  const Text(
                      'Server Location',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                    ),
                  ),
                  const Icon(Icons.settings_outlined,),
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
                  controller: _searchServerController,
                  onChanged: _loadSearchedServers,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey.shade400,),
                    hintText: 'Search here',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold),
                    suffixIcon: _searchServerController.text.isNotEmpty ? IconButton(icon: const Icon(Icons.clear), onPressed: _clearSearch,) : null,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Recommendation',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Column(
                        children: [
                          Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                width: double.infinity,
                                height: 66,
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.orange
                                          ),
                                          child: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white.withOpacity(0.8),
                                            ),
                                            child: const Icon(Icons.star, size: 16, color: Colors.orange,),
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        const Text(
                                          'Fast Servers',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 77,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: const Text(
                                            'PREMIUM',
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.8
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: kColorBg.withOpacity(0.7),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.arrow_forward_ios_rounded, size: 14,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                width: double.infinity,
                                height: 66,
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff28C0C1)
                                          ),
                                          child: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffFAFAFA),
                                            ),
                                            child: const Icon(Icons.electric_bolt_outlined, size: 16, color: Color(0xff28C0C1),),
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        const Text(
                                          'Fast Servers',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 45,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.orange.withOpacity(0.09),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: const Text(
                                            'FREE',
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.8
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: kColorBg.withOpacity(0.7),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.arrow_forward_ios_rounded, size: 14,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'All Server',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      ..._searchedServerData.map((server) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20,),
                                width: double.infinity,
                                height: 66,
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(server['src']),
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  server['name'],
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(width: 5,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: server['isFree'] ? const Color(0xff28C0C1) : Colors.orange
                                                  ),
                                                  child: Container(
                                                    width: 15,
                                                    height: 15,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: server['isFree'] ? const Color(0xffFAFAFA) : Colors.white.withOpacity(0.8),
                                                    ),
                                                    child: Icon(
                                                      server['isFree'] ? Icons.electric_bolt_outlined : Icons.star,
                                                      size: 10,
                                                      color: server['isFree'] ? const Color(0xff28C0C1) : Colors.orange,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${server['locations']} Locations',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: kColorBg.withOpacity(0.7),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.arrow_forward_ios_rounded, size: 14,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
