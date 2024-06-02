import 'package:flutter/material.dart';  
  
  
class ListViewApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      title: 'Flutter Demo',  
      theme: ThemeData(  
        primarySwatch: Colors.blue,  
      ),  
      home: Scaffold(  
        appBar: AppBar(  
          title: Text('List to Detail'),  
        ),  
        body: MyHomePage(),  
      ),  
    );  
  }  
}  
  
class MyHomePage extends StatefulWidget {  
  @override  
  _MyHomePageState createState() => _MyHomePageState();  
}  
  
class _MyHomePageState extends State<MyHomePage> {  
  String selectedItem = ''; // 用于保存选中的列表项  
  
  // 假设的列表数据  
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];  
  
  void _onItemSelected(String item) {  
    setState(() {  
      selectedItem = item; // 更新选中的项  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Row(  
      children: [  
        // 左边列表  
        Expanded(  
          child: ListView.builder(  
            itemCount: items.length,  
            itemBuilder: (context, index) {  
              return ListTile(  
                title: Text(items[index]),  
                onTap: () => _onItemSelected(items[index]), // 点击列表项时触发  
              );  
            },  
          ),  
        ),  
  
        // 垂直分隔线（可选）  
        VerticalDivider(width: 1),  
  
        // 右边内容区域  
        Expanded(  
          child: Container(  
            padding: EdgeInsets.all(16),  
            child: selectedItem.isEmpty  
                ? Text('Please select an item from the list.')  
                : Text('You selected: $selectedItem'), // 根据选中项显示内容  
          ),  
        ),  
      ],  
    );  
  }  
}