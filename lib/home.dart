import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController _scrollController = ScrollController();

  void _scrollToText() {
    // Adjust the offset based on your layout and text position
    _scrollController.animateTo(
      200.0, // Adjust this value to scroll to the desired position
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  List<Map<String, dynamic>> mydata = [];
  List<String> selectedOptions = [];

  Future<void> apiCall() async {
    try {
      Map<String, String> headers = {
        'X-RapidAPI-Key': 'bb2e019fd2mshf6ec42d6fadfeb5p12eb7fjsn4510710822f3',
      };
      http.Response response = await http.get(
        Uri.parse('https://quiz26.p.rapidapi.com/questions'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        setState(() {
          Map<String, dynamic> data = json.decode(response.body);
          mydata = List<Map<String, dynamic>>.from(data['data']);
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xf1f1f1f1),
        appBar: AppBar(
          elevation: 1.2,
          backgroundColor: Colors.deepPurple[400],
          foregroundColor: Colors.white,
          title: Text('Quiz App'),
        ),
        body: mydata.isEmpty
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Container(
          width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(

              ),
              child: Center(
                child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                return  Padding(
                    padding: const EdgeInsets.only(top: 130,left: 10,right: 10),
                    child: Card(
                      color: Colors.white,
elevation: 1.6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Q:-  '+
                              mydata[index]['question'],
                              style: TextStyle(fontSize: 17.0,),
                            ),
                            SizedBox(height: 5,),
                            Text('Options:-',textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.w500,),),
                            SizedBox(height: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              List.generate(

                                mydata[index]['options'].length,
                                    (optionIndex) {
                                  final option = mydata[index]['options'][optionIndex];
                                  final isOptionSelected =
                                  selectedOptions.contains(option);
                                  final isCorrectOption =
                                      mydata[index]['answer'] == option;
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 18,left: 10,right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                        boxShadow: [new BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2.0,
                                        ),]),

                                    child: ListTile(
                                    //  shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: Colors.grey),borderRadius: BorderRadius.circular(10)),
                                      title: Text(
                                        option,
                                        style: TextStyle(
                                          color: isOptionSelected
                                              ? (isCorrectOption
                                              ? Colors.green
                                              : Colors.red)
                                              : Colors.black,
                                        ),
                                      ),
                                      onTap: () {
                                        // Toggle the selected option
                                        setState(() {
                                          if (isOptionSelected) {
                                            selectedOptions.remove(option);
                                          } else {
                                            selectedOptions.add(option);
                                          }
                                        });
                                      },
                                    ),
                                  );
                                },
                              ),

                            ),
                            const Divider(),
                            Center(
                              child: MaterialButton(

                                color: Colors.blueGrey,
                                onPressed: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder:   (context) => const HomeScreen(),));
                              },
                              child: Text('Tab to Go Next Question',style: TextStyle(color: Colors.white),),),
                            )
                          ],
                        ),
                      ),
                    ),

                );
                        },
                      ),
              ),
            ),
      ),
    );
  }
}
