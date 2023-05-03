import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/screen/login.dart';
import 'package:login/screen/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.jpg",
                height: 400,
                width: 350,
              ),
             
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("เข้าสูระบบ", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      })
                    );
                  },
                ),
              ),
               SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label:
                      Text("สร้างบัญชีผู้ใช้ ", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context) {
                       return RegisterScreen();
                      }                      
                    )
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
           
            //ตรา
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
              child: Container(
                width: 170.0,
                height: 170.0,
                child: Image.asset("assets/images/001.png"),
              ),
            ),
            //ช่องบัตรประชาชน
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
              child: Column(
                children: [
                  const Text("ลงชื่อเข้าสู่ระบบ",style: TextStyle(fontSize: 25)),
                  const SizedBox(height: 25,),
                  Builder(builder: (context) {
                    return const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'เลขประจำตัวประชาชน',
                      ),
                    );
                  }),
                  //ช่องรหัสผ่าน
                  const SizedBox(height: 15),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'รหัสผ่าน',
                    ),
                  ),
                  //ปุ่มลืมรหัสผ่าน
                  TextButton(
                    onPressed: () {},
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'ลืมรหัสผ่าน?',
                      ),
                    ),
                  ),
                  //ปุ่มเข้าสู่ระบบ
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff009246),
                      ),
                      icon: const Icon(Icons.login),
                      label:
                          const Text("เข้าสู่ระบบ", style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
            //สร้างบัญชี
            const SizedBox(height: 120),
            const Text("ยังไม่มีบัญชีใช่หรือไม่?"),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  }));
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'สร้างบัญชีใหม่',
                  ),
                ),
              ),
              
            
          ],
        ),
      ),
    );
  }
}*/