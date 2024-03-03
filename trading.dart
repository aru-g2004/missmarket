import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: const BottomSelectionWidget(),
    );
  }
}

class BottomSelectionWidget extends StatefulWidget {
  const BottomSelectionWidget({Key? key}) : super(key: key);

  @override
  _BottomSelectionWidgetState createState() => _BottomSelectionWidgetState();
}

class _BottomSelectionWidgetState extends State<BottomSelectionWidget> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _onItemSelected,
          children: const [
          //  YahooFinanceServiceWidget(),
            DTOSearch(),
           // RawSearch(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemSelected,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            label: 'DTO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.raw_on),
            label: 'Raw',
          ),
        ],
      ),
    );
  }

  void _onItemSelected(int index) {
    setState(() {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
      _selectedIndex = index;
    });
    debugPrint(index.toString());
  }
}

class DTOSearch extends StatefulWidget {
  const DTOSearch({Key? key}) : super(key: key);

  @override
  State<DTOSearch> createState() => _DTOSearchState();
}

class _DTOSearchState extends State<DTOSearch> {
  final TextEditingController controller = TextEditingController(text: 'GOOG');
  late Future<YahooFinanceResponse> future;

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Ticker from yahoo finance'),
        TextField(
          controller: controller,
        ),
        MaterialButton(
          onPressed: load,
          child: const Text('Load'),
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: FutureBuilder(
            future: future,
            builder: (BuildContext context,
                AsyncSnapshot<YahooFinanceResponse> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('No data');
                }

                final response = snapshot.data!;
                return ListView.builder(
                  itemCount: response.candlesData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final candle = response.candlesData[index];
                    return _CandleCard(candle);
                  },
                );
              } else {
                return const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  void load() {
    future = YahooFinanceDailyReader().getDailyDTOs(controller.text);
    setState(() {});
  }
}

class _CandleCard extends StatelessWidget {
  final YahooFinanceCandleData candle;
  const _CandleCard(this.candle);

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat('yyyy-MM-dd').format(candle.date);

    return Card(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(date),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Open: ${candle.open.toStringAsFixed(2)}'),
                Text('Close: ${candle.close.toStringAsFixed(2)}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Low: ${candle.low.toStringAsFixed(2)}'),
                Text('High: ${candle.high.toStringAsFixed(2)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
