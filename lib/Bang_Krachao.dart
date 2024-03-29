import 'package:flutter/material.dart';
import 'package:project/home.dart';

class Bang_Krachao extends StatelessWidget {
  const Bang_Krachao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('บางกระเจ้า'),
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
                    "https://img.pptvhd36.com/thumbor/2023/12/16/news-d4816b8.jpg",
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ในประเทศไทยกับ “บางกระเจ้า” ซึ่งเป็นเกาะหนึ่งในอำเภอพระประแดง จังหวัดสมุทรปราการ มีลักษณะเด่นคือเป็นเกาะเทียมที่เกิดจากคุ้งแม่น้ำเจ้าพระยาโดยมีคลองลัดโพธิ์เชื่อมแม่น้ำทางทิศตะวันตก เป็นพื้นที่เกษตรกรรมที่มีประชากรอาศัยไม่หนาแน่น และยังได้รับการยกย่องให้เป็นปอดกลางเมืองที่ดีที่สุดในเอเชียจากนิตยสาร Time Asia ด้วย\n",
                        ),
                        SizedBox(height: 8),
                        Text(
                          "สำหรับที่เที่ยวในบางกะเจ้าที่มียอดค้นหามากมายคือ “ตลาดบางน้ำผึ้ง” ซึ่งเป็นตลาดที่ขายทั้ง ของกิน ของใช้ และสินค้ามากมาย ไม่ว่าจะเป็นอาหารพื้นบ้าน อาหารคาว อาหารหวาน และสินค้าโอทอปจากคนในชุมชนบางน้ำผึ้ง ทำให้ตลาดบางน้ำผึ้งเป็นหนึ่งในที่เที่ยวบางกะเจ้าที่หลายคนอยากมาเยือน",
                        ),
                        // SizedBox(height: 8),
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
