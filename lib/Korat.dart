import 'package:flutter/material.dart';
import 'package:project/home.dart';

class Korat extends StatelessWidget {
  const Korat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('โคราช'),
        backgroundColor: Color.fromRGBO(84, 196, 134, 0.875),
      ),
      drawer: DrawerA(),
      body: Container(
        color: Color.fromRGBO(99, 169, 131, 0.301),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "https://img.pptvhd36.com/thumbor/2023/12/16/news-a9868f5.jpg",
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "“โคราช” หรือจังหวัดนครราชสีมา ที่สามารถมาเที่ยวได้ตลอดทั้งปี แถมมีที่เที่ยวหลากหลายรูปแบบ ตอบโจทย์ทุกไลฟ์สไตล์ ไม่ว่าจะเป็นอนุสาวรีย์ท้าวสุรนารี ซึ่งถือเป็นสัญลักษณ์โดดเด่นของจังหวัด สวนสัตว์นครราชสีมา เขื่อนลำตะคอง Primo Piazza รวมถึงที่เที่ยวทางประวัติศาสตร์อย่างอุทยานประวัติศาสตร์พิมาย\n",
                        ),
                        SizedBox(height: 8),
                        Text(
                          "และสำหรับที่เที่ยวในจังหวัดนครราชสีมา ที่มีคนค้นหามากที่สุด คือสถานที่ท่องเที่ยวทางธรรมชาติชื่อดังอย่าง “เขาใหญ่” ซึ่งเป็นอุทยานแห่งชาติแห่งแรกของไทย ที่แม้จะเคยมีข่าวดังมากมายอันเป็นเหตุไม่คาดคิดอย่างช้างป่าบุกโซนที่พัก หรือน้ำป่าไหลหลาก แต่ก็ปฏิเสธไม่ได้ว่า เขาใหญ่ ยังคงเป็นจุดหมายปลายทางหลักของสายลุยหลายคน จากธรรมชาติอันสงบ สวยงาม น่าพักผ่อน คุ้มค่ากับทุกหยาดเหงื่อที่เดินทางมาเยือน\n",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(99, 169, 131, 0.301),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/homepage');
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
