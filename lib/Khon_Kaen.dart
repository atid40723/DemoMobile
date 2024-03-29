import 'package:flutter/material.dart';
import 'package:project/home.dart';

class Khon_Kaen extends StatelessWidget {
  const Khon_Kaen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ขอนแก่น'),
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
                    "https://img.pptvhd36.com/thumbor/2023/12/16/news-9e8e169.jpg",
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
                          "มากันที่ภาคอีสานกันบ้างกับที่เที่ยวยอดค้นหาอันดับ 7 ในประเทศไทยอย่าง “ขอนแก่น” แหล่งรวมความสุขที่มีการเดินทางสะดวก สามารถเที่ยวได้ทั้งในเมือง ไหว้พระวัดดัง ฟังเสียงธรรมชาติ ท่องอุทยาน และเที่ยวสวนสัตว์ สังเกตได้ว่าผู้ที่สนใจท่องเที่ยวในจังหวัดขอนแก่น จะค้นหาคำว่า “บึงแก่นนคร” มากที่สุด\n",
                        ),
                        SizedBox(height: 8),
                        Text(
                          "โดนบึงแก่นนคร ถือเป็นหนึ่งในแลนด์มาร์กของขอนแก่นที่ต้องมาเยือน เป็นสถานที่พักผ่อนหย่อนใจของชาวขอนแก่น ในยามเย็นจะมีผู้คนออกมาเดินเล่นออกกำลังกายกันเป็นจำนวนมาก เหมาะแก่การมาพักผ่อนแบบชิล ๆ ไร้ความวุ่นวายแบบสังคมเมืองโดยสิ้นเชิง\n",
                        ),
                        SizedBox(height: 8),
                        Text(
                          "นอกจากบึงแก่นนครแล้ว ขอนแก่น ยังมีสถานที่ท่องเที่ยวมากมายรอนักเดินทางมาเยือน ไม่ว่าจะเป็น เขื่อนอุบลรัตน์ สวนสัตว์ขอนแก่น พิพิธภัณฑ์ไดโนเสาร์ภูเวียง วัดพระธาตุหนองแวง วัดทุ่งเศรษฐี และอุทยานแห่งชาติภูผาม่าน เรียกได้ว่ามีทั้งที่เที่ยวทางธรรมชาติ ทางวัฒนธรรม และแหล่งความรู้มากมายรอให้นักท่องเที่ยวได้สัมผัส",
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
