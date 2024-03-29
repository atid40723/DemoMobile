import 'package:flutter/material.dart';
import 'package:project/home.dart';

class Koh_Kradan extends StatelessWidget {
  const Koh_Kradan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เกาะกระดาน'),
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
                    "https://img.pptvhd36.com/thumbor/2023/12/16/news-096c217.jpg",
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
                          "จุดเด่นของเกาะกระดานคือ ชายหาดหลักที่เกาะกระดาน มีชื่อที่เพราะพริ้งไม่แพ้ความสวยงาม เรียกว่า “หาดพาราไดซ์” ขณะที่อีกหาดก็ไม่แพ้กัน คือ “หาดซันเซ็ต” ซึ่งเป็นสถานที่ไฮไลต์ที่เราสามารถชมวิวพระอาทิตย์ตกเหนือทะเลอันดามันได้\n",
                        ),
                        SizedBox(height: 8),
                        Text(
                          'วิธีการเดินทางมายังเกาะกระดาน ต้องใช้บริการเรือหางยาวบนฝั่งที่มีอยู่หลายลำ และหากใครอยากวางแผนที่จะพักบนเกาะ ที่นี่ก็มีรีสอร์ทขนาดเล็กหลายแห่งให้เลือก ตั้งแต่ที่พักหรูแต่เรียบง่ายสไตล์ "แฟลชแพคเกอร์" ไปจนถึงบังกะโลริมชายหาดสุดหรู\n',
                        ),
                        SizedBox(height: 8),
                        Text(
                          "นอกจากนี้ เกาะกระดานไม่มีคนพลุกพล่านและเสียงรบกวน น้ำทะเลอุ่น-สวยใสอยู่เสมอ จึงเหมาะสำหรับนักท่องเที่ยวที่ต้องการความเป็นส่วนตัวและชอบทำกิจกรรมทางทะเล ไม่ว่าจะเป็นการว่ายน้ำ ดำน้ำตื้นดูปลาการ์ตูน สัตว์ทะเล และปะการังที่หลากหลาย รวมถึงการพายเรือรอบเกาะ",
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
