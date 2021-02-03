import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stolik_dla_ciebie/authenticate/login.dart';


final auth = FirebaseAuth.instance;

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double height1 = MediaQuery.of(context).size.height;
    double height = height1 - padding.top - kToolbarHeight;
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Stolik dla ciebie'),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.logout), onPressed: (){
            auth.signOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
          })
        ],
      ),
      body: Center(
        //Widok listy
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          children: <Widget>[

            //Restauracja Włoska
            Container(
                height: height/3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'lib/assets/wloska.jpg'),
                      fit: BoxFit.fill,
                    )
                ),
                child: Center(
                    child: FlatButton(
                        color: Colors.deepOrange,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.red,
                        onPressed: (){ Navigator.pushNamed(context, '/wloska');},
                        child: Text(
                          'Restauracja Włoska',
                          style: TextStyle(fontSize: 20),
                        )
                    )
                )
            ),

            //Restauracja Gruźińska
            Container(
              height: height/3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/assets/gruzinska.jpg'),
                    fit: BoxFit.fill,
                  )
              ),
              child: Center(
                child: FlatButton(
                  color: Colors.deepOrange,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.red,
                  onPressed: (){Navigator.pushNamed(context, '/gruzinska');},
                  child: Text(
                    "Restauracja Gruźińska",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),

            //Restauracja Amerykańska
            Container(
              height: height/3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/burger.jpg'),
                    fit: BoxFit.fill,
                  )
              ),
              child: Center(
                child: FlatButton(
                  color: Colors.deepOrange,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.red,
                  onPressed: (){Navigator.pushNamed(context, '/amerykanska');},
                  child: Text(
                    "Restauracja Amerykańska",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

