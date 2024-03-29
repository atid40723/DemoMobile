import 'package:flutter/material.dart';
import 'package:project/home.dart';

class Phitsanulok extends StatelessWidget {
  const Phitsanulok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('พิษณุโลก'),
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
                    "https://img.pptvhd36.com/thumbor/2023/12/16/news-478c75e.jpg",
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
                          "“พิษณุโลก” หรือ เมืองสองแคว ที่ขึ้นชื่อว่าเป็นเมืองท่องเที่ยวทางวัฒนธรรมที่สำคัญแห่งหนึ่งของไทย อีกทั้งยังมีกิจกรรมท่องเที่ยวทางธรรมชาติที่น่าสนใจมากมายไม่ว่าจะเป็นการพักผ่อนเล่นน้ำที่น้ำตกชาติตระการ ล่องแพที่อ่างเก็บน้ำห้วยซำรู้ ล่องแก่งแนวแอดเวนเจอร์ในลำน้ำเข็ก เป็นต้น\n",
                        ),
                        SizedBox(height: 8),
                        Text(
                          "และไฮไลท์ที่เรียกได้ว่าต้องมาเยือนให้ได้ หากมายังจังหวัดพิษณุโลก นั่นคือ วัดพระศรีรัตนมหาธาตุราชวรมหาวิหาร ที่นอกจากจะเป็นที่ประดิษฐาน “พระพุทธชินราช” ซึ่งได้ชื่อว่าเป็นพระพุทธรูปที่มีความงดงามที่สุดประเทศไทยแล้ว ยังมี พระวิหารพระเจ้าเข้านิพพาน ซึ่งเป็นที่ประดิษฐานหีบบรรจุพระบรมศพขององค์สมเด็จพระสัมมาสัมพุทธเจ้าจำลองเอาไว้ด้วย",
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
