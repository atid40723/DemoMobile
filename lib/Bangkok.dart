import 'package:flutter/material.dart';
import 'package:project/home.dart';

class Bangkok extends StatelessWidget {
  const Bangkok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('กรุงเทพมหานคร'),
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
                    "https://img.pptvhd36.com/thumbor/2023/12/16/news-22196ad.jpg",
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
                          "เป็นสถานที่แห่งแสงสีที่ไม่เคยเงียบเหงา เป็นศูนย์กลางการท่องเที่ยวหลายรูปแบบ ไม่ว่าจะเป็นวัดพระเชตุพนวิมลมังคลาราม SEA Life Bangkok พิพิธภัณฑสถานแห่งชาติพระนคร ICON Siam รวมถึงสวนน้ำดังอย่างสวนสยาม และสวนสัตว์อย่าง ซาฟารี เวิลด์\n",
                        ),
                        SizedBox(height: 8),
                        Text(
                          "นอกจากนี้ ผู้คนยังค้นหาสถานที่ท่องเที่ยวบริเวณปริมณฑลด้วย ไม่ว่าจะเป็นสถานที่ท่องเที่ยวจังหวัดสมุทรปราการ เกาะเกร็ด หรือสถานที่ท่องเที่ยวทางธรรมชาติใกล้เคียงกรุงเทพฯ ที่แม้ว่าจะไม่ได้เข้าไปยังกรุงเทพฯ โดยตรง แต่ก็ยังสามารถพักผ่อนตามความต้องการได้ไม่ต่างกัน\n",
                        ),
                        SizedBox(height: 8),
                        Text(
                          "อีกหนึ่งจุดเด่นที่ผู้คนค้นหาสถานที่ท่องเที่ยวในกรุงเทพฯ นั้น คือ “ตลาดนัด” โดยเฉพาะตลาดนัดกลางคืนที่เป็นสถานที่พบปะสำหรับวัยรุ่นและผู้ที่นิยมแฮงค์เอาต์ ไม่ว่าจะเป็นตลาดนัดรถไฟศรีนครินทร์ ตลาดนัดรถไฟรัชดา หรือตลาดนัดจตุจักร สำหรับผู้นิยมการท่องราตรีทั้งชาวไทยและชาวต่างชาติ",
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
