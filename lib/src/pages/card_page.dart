import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),

      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2('https://i0.wp.com/zsuttonphoto.com/wp-content/uploads/2019/11/Los-Angeles-Beauty-Photography-19.jpg?fit=3000%2C3750&ssl=1'),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2('https://photogrist.com/wp-content/uploads/2018/11/Ted-Emmons.jpg'),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2('https://upload.wikimedia.org/wikipedia/commons/2/2a/Portrait_of_Maria_Dalmazzo%2C_Headshot_in_black_and_white_by_Ricardo_Pinz%C3%B3n.jpg'),
          SizedBox(height: 30.0,),
          _cardType2('https://lh3.googleusercontent.com/proxy/gMJv4BrG3Uyr8y5Ezod1XKDL4J-yZ5gOpDyhClNAlTwMF7hYB3KHJg32UqEH0Vq4kQwegeyS6ItuPQNjvWrdOYUvHOAMw0Bh2-0Rpte83cIvIGzVEwq4ljtQE0fcFpuVC-nWRk5nlFo5CTYNa-VGWNgg1dTnzn-g0xti3k_6aebdxOllF0vxBg'),
        ],
      ),

    );
  }
}

Widget _cardType1(){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)
    ),
    elevation: 10.0,
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.all(15.0),
          title: Text('What is Lorem Ipsum?'),
          subtitle: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book'),
          leading: Icon( Icons.settings, color: Colors.blue, ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text('Cancel'),
              textColor: Colors.blue,
            ),
            FlatButton(
              onPressed: (){},
              child: Text('Ok'),
              textColor: Colors.blue,
            ),
          ],
        ),
      ],
    ),
  );
}


Widget _cardType2(String url){
  final card = Container(
    color: Colors.white,
    child: Column(

      children: <Widget>[
        FadeInImage(
          image: NetworkImage(url),
          placeholder: AssetImage( 'assets/original.gif' ),
          fadeInDuration: Duration( milliseconds: 2000 ),
          height: 500.0,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters'
          ),
        )
      ],
    ),
  );

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(2.0 , 5.0)
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: card,
    ),
  );
}