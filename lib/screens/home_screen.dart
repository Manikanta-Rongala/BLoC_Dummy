
import 'package:bloc_dummy/models/user_model.dart';
import 'package:flutter/material.dart';

import '../blocs/user_data_bloc.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    userDataBloc.fetchUserData();
  }

  @override
  void dispose() {
    userDataBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(title: const Center(child: Text("User Data")),
      ),
      body: StreamBuilder(
        stream: userDataBloc.userDataStream,
        builder: (context,AsyncSnapshot<List<UserModel>> snapshot) {
        if (snapshot.hasData){
         // data = snapshot.hasData;
          return ListView.builder(
             itemCount: snapshot.data?.length,
              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shadowColor: Colors.deepOrange,
                child: ListTile(
                  title:Text(snapshot.data![index].email),

                  trailing: Text(snapshot.data![index].mobileNumber),

                ),
              ),
            );
          } );


        }else if (snapshot.hasError){
          return const Text("error");
        }
        return const Center(child: CircularProgressIndicator());


      },),
    );
  }
}
