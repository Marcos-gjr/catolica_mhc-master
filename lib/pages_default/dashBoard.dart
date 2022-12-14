import 'package:catolica_mhc/pages_default/login.dart';
import 'package:catolica_mhc/pages_default/perfil.dart';
import 'certificados.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'doughnutChart.dart';
import 'notificacoes.dart';

/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
        //brightness: Brightness.dark    (Modo escuro, bugado)
      ),
      home: DashBoard(),
    );
  }
}
*/
class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}
//---------------------------------------------------------
class _DashBoardState extends State<DashBoard> {
  late TooltipBehavior _tooltipBehavior;
//---
/*
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
*/
//---
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
//---------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              Container(
                child:
                Image.asset("images/user_icon.png", width: 80, height: 35),
              )
            ],
          ),
          backgroundColor: Colors.white,
        ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "Suas Estat??sticas",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),


              Container(
                  child: SfCircularChart(
                      legend: Legend(
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap,
                          position: LegendPosition.bottom),
                      // Legenda abaixo do gr??fico (default: direita)
                      tooltipBehavior: _tooltipBehavior,
                      series: <CircularSeries>[
                    // Renders doughnut chart
                    DoughnutSeries<ChartData, String>(
                      dataSource: chartData,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,

                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true,
                      //Liberando modifica????es Tooltip

                      explode:
                          true, //Clicar no gr??fico destaca a sua estat??stica
                    ),
                  ],
                  ),

                  // Desenvolvimento de progress bar e resumo

                  ),


                Column(
                  children: <Widget>[
                    new LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width * 0.6,
                      animation: true,
                      alignment: MainAxisAlignment.center,
                      barRadius: Radius.circular(10),
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      percent: 0.5,
                      center: Text("50.0%", style: TextStyle(fontWeight: FontWeight.bold),),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.green,
                    ),
                  ],
                ),


            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
        },
        child: Icon(Icons.add), //icon inside button
        backgroundColor: Color(0xFFb81317),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomAppBar(
            //bottom navigation bar on scaffold
            color: Colors.transparent,
            shape: const CircularNotchedRectangle(),
            //shape of notch
            notchMargin: 5,
            clipBehavior: Clip.antiAlias,
            //notche margin between floating button and bottom appbar
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFb81317), Color(0xFF720507)],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  stops: [0.1, 0.8],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Row(
                //children inside bottom appbar
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Certificados())

                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.analytics,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Notificacoes())

                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Perfil())

                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // Barra inferior antiga, descontinuada
      /* bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffb81317),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("img/home_icon_branco.png", height: 33,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("img/relatorio_icon_branco.png", height: 33,),
            label: "Certificados",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("img/btn_add.png", height: 43,),
            label: "Enviar",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("img/notification_icon_branco.png", height: 33,),
            label: "Notifica????es",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("img/usuario_icon_branco.png", height: 33,),
            label: "Perfil",
          ),
        ],
      ), */
    );
  }
}
