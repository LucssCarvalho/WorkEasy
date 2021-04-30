import 'package:WorkEasy/screen/workDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:WorkEasy/model/works.dart';
import 'package:WorkEasy/networking/firebaseDbNetworking.dart';

class WorksScreen extends StatefulWidget {
  final String category;
  final Color colorCategory;

  WorksScreen(this.category, this.colorCategory);

  @override
  _WorksScreenState createState() => _WorksScreenState();
}

class _WorksScreenState extends State<WorksScreen> {
  FirebaseDbNetworking firebaseDbNetworking = FirebaseDbNetworking();
  Future<List<WorkResponse>> _futureWorks;

  @override
  void initState() {
    super.initState();
    _getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.colorCategory,
        title: Text(widget.category),
      ),
      backgroundColor: Colors.purple[50],
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<WorkResponse>>(
                future: _futureWorks,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<WorkResponse> list = snapshot.data
                        .where((element) => element.category == widget.category)
                        .toList();

                    return ListView.builder(
                        padding: EdgeInsets.all(4.0),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          var work = list[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => WorkDetailScreen(work),
                                ),
                              );
                            },
                            child: Card(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        work.title,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[800]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.person_outline_outlined,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              work.name,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[700]),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getQuestions() {
    var _futureQuestionsModel = firebaseDbNetworking.getFirebaseQuestions();

    setState(() {
      _futureWorks = _futureQuestionsModel;
    });
  }
}
