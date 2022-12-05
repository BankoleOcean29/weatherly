import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'location.dart';
import 'network.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();

  TabController? _tabController;

  DateTime date = DateTime.now();



  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    getLocation();
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
  }

  void getData() async {
    void getWeatherData() async {
      Response response = (Uri.https('https://api.openweathermap.org/data/2.5/weather?lat=${''}&lon={lon}&appid=${apiKey}')) as Response;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFF8E1),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
              child: Container(
                //color: Color(0xffD7CCC8),
                width: 400,
                height: 45,
                child: AnimSearchBar(
                  width: 400,
                  textController: textEditingController,
                  onSuffixTap: () {},
                ),
              ),
            ),
            TabBar(
              labelColor: Colors.black,
              indicator: MaterialIndicator(
                color: Colors.black,
                height: 2,
              ),
              tabs: const [
                Tab(
                  text: 'Today',
                ),
                Tab(
                  text: 'Tomorrow',
                ),
              ],
              controller: _tabController,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 150.0),
                      child: Text(date.toString()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 290.0),
                      child: Text(
                        'Tokyo',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 300.0),
                      child: Text('Japan'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Container(
                        height: 280,
                        width: 280,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0, left: 240),
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.location_on),
                      ),
                    )
                  ]),
                  Column(children: [
                    Text(date.toString()),
                    const Text('lib'),
                    const Text('Japan'),
                    Container(
                      margin: const EdgeInsets.all(100.0),
                      decoration: const BoxDecoration(
                          color: Colors.orange, shape: BoxShape.circle),
                    )
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
