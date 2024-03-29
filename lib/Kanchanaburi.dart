import 'package:flutter/material.dart';
import 'package:project/home.dart';

class Kanchanaburi extends StatelessWidget {
  const Kanchanaburi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('กาญจนบุรี'),
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
                    "https://img.pptvhd36.com/thumbor/2023/12/16/news-11ca986.jpg",
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
                          "สำหรับที่เที่ยวในจังหวัดกาญจนบุรี ส่วนใหญ่จะเป็นสถานที่ท่องเที่ยวตามธรรมชาติ ไม่ว่าจะเป็นสะพานข้ามแม่น้ำแคว เขื่อนศรีนครินทร์ เขื่อนวชิราลงกรณ์ สะพานมอญที่เป็นสะพานไม้ที่ยาวที่สุดในประเทศไทย อุทยานแห่งชาติน้ำตกไทรโยค หรืออุทยานแห่งชาติเอราวัณ ที่สามารถมาเยือนได้ตลอดทั้งปี\n",
                        ),
                        SizedBox(height: 8),
                        Text(
                          "นอกจากที่เที่ยวกินลมชมบรรยากาศธรรมชาติแล้ว อีกหนึ่งไฮไลท์ของจังหวัดกาญจนบุรี ที่สายเที่ยวต้องไม่พลาด นั่นคือ “สกายวอล์กสองแคว-แม่กลอง” หรือเรียกสั้น ๆ อย่างไม่เป็นทางการว่า “สกายวอล์กเมืองกาญจน์” ที่เป็นจุดชมวิวและชมการบรรจบกันของแม่น้ำสองสี คือแม่น้ำแควใหญ่และแม่น้ำแควน้อย เรียกความสนใจของนักท่องเที่ยวได้มากมาย",
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
