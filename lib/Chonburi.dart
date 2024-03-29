import 'package:flutter/material.dart';
import 'package:project/home.dart';

class Chonburi extends StatelessWidget {
  const Chonburi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ชลบุรี'),
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
                    "https://img.pptvhd36.com/thumbor/2023/12/16/news-db92f99.jpg",
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
                          "อีกหนึ่งจุดหมายยอดฮิตของนักท่องเที่ยวในไทย ที่ต้องการแสวงหาที่พักใกล้กรุงเทพฯ เนื่องจากใช้เวลาเดินทางจากกรุงเทพฯ เพียงชั่วโมงกว่า ๆ เท่านั้น\n",
                        ),
                        SizedBox(height: 8),
                        Text(
                          "โดยแหล่งท่องเที่ยวภายในจังหวัดชลบุรีที่ถูกค้นหาจะมีหลากหลาย ทั้งสถานที่ท่องเที่ยวตามอำเภอต่าง ๆ อย่าง บางแสน ศรีราชา สัตหีบ บางเสร่ หรือเขตปกครองพิเศษพัทยา ที่โดดเด่นในเรื่องอาหารการกินและที่พักริมทะเลรวมถึงสถานที่ท่องเที่ยวที่เป็นแลนด์มาร์กดังของจังหวัดเช่นกัน ไม่ว่าจะเป็น สกายวอล์กวัดเขาตะแบก  พิพิธภัณฑ์สัตว์น้ำบางแสน สวนสัตว์เปิดเขาเขียว สวนนงนุช ปราสาทสัจธรรม และอ่างเก็บน้ำบางพระ เป็นต้น",
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
