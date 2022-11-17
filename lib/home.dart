import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_fetch4/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DataProvider>(context, listen: false).getDataProvider();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON DATA')),
      body: Consumer<DataProvider>(
        builder: ((context, value, child) {
          final dataprovider = value.datamodel;
          final infoprovider = dataprovider?.info;
          final pengalamanprovider = dataprovider?.pengalaman;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("INFO DATA :"),
              Text("Nama : ${dataprovider?.nama}"),
              Text("Nama : ${dataprovider?.umur}"),
              Text(
                  "Alamat : ${infoprovider?.alamat ?? ""} | Wa : ${infoprovider?.wa ?? ""}"),
              const Text("Pengalaman : "),
              Expanded(
                child: ListView.builder(
                  itemCount: pengalamanprovider?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(pengalamanprovider?[index].kantor ?? ""),
                      subtitle:
                          Text("Sebagai ${pengalamanprovider?[index].profesi}"),
                      trailing: Text(
                          "${pengalamanprovider?[index].lamapengalaman} Tahun"),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
