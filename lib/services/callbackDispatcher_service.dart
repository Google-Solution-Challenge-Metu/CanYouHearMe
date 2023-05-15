import 'package:workmanager/workmanager.dart';

void printData(){
  print("printle **************3131313131313131313313131131313131313");
}

void callbackDispatcherr(taskName){
  taskName='print';
  Workmanager().executeTask((taskName,inputData){
    switch(taskName){
      case 'toFirebase':
        break;
      case 'print':
        printData();
        break;
      default:
    }
    return Future.value(true);
  });
}