import 'package:flutter/material.dart';
import 'package:project/home.dart';

class Lao_Khwan extends StatelessWidget {
  const Lao_Khwan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เลาขวัญ'),
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
                    "https://img.pptvhd36.com/thumbor/2023/12/16/news-7c52e42.avif",
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
                            "หนึ่งในจังหวัดกาญจนบุรี ที่แม้จะไม่มีที่เที่ยวเด่นดังเหมือนจุดอื่นในจังหวัด แต่ด้วยความที่มีวัดมากกว่า 62 แห่ง ทำให้อำเภอเลาขวัญเป็นหนึ่งในจุดหมายปลายทางของสายบุญ ที่ต้องการมาเติมแต้มบุญพร้อมพักผ่อนไปในตัว\n"),
                        SizedBox(height: 8),
                        Text(
                          "ไม่ว่าจะเป็น วัดเฉลิมชัยมงคลสามัคคี วัดเลาขวัญ วัดสุวรรณคีรี (เขาปูน) วัดเขากาญจนาเขต และวัดเขาวงพระจันทร์ เป็นต้น และยังมีโรงแรมและรีสอร์ทระดับ 3 ดาวหลายแห่งด้วย",
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
