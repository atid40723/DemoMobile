import 'package:flutter/material.dart';
import 'package:project/home.dart';

class HuaHinCha_am extends StatelessWidget {
  const HuaHinCha_am({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('หัวหิน ชะอำ'),
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
                    "https://img.pptvhd36.com/thumbor/2023/12/16/news-5908842.jpg",
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
                          '“หัวหิน ชะอำ” ซึ่งเป็นแหล่งท่องเที่ยวยอดฮิตของจังหวัดเพชรบุรีและประจวบคีรีขันธ์ โดยเฉพาะชายหาดชื่อดังอย่าง หาดชะอำ ที่มาพร้อมที่นั่งและร้านอาหารตลอดแนว สามารถรับชมทิวทัศน์ริมทะเลได้ไม่แพ้ที่อื่น\n',
                        ),
                        SizedBox(height: 8),
                        Text(
                          "นอกจากชายหาดอันโดดเด่นแล้ว ทั้งอำเภอหัวหิน และอำเภอชะอำ ยังมาพร้อมกับที่เที่ยวหลากหลายรูปแบบ ซึ่งถูกค้นหาบน Google มากมาย ทั้งสวนน้ำ ฟาร์มแกะ Swiss Sheep Farm เมืองเวนิสจำลองอย่าง Siam Venezia หรือโรงแรมดังอย่าง Holidays Inn Hua Hin หรือจะเป็นสถานที่ท่องเที่ยวทางธรรมชาติอันน่าค้นหาอย่าง เขาอีบิด ถ้ำเขาหลวง เขาวัง และหาดเจ้าสำราญ",
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
